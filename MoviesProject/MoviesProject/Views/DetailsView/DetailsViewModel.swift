//
//  DetailsViewModel.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 16.4.25.
//

import SwiftUI

class DetailsViewModel: ObservableObject {
    @Service var manager: ContentManager?
    @Service var cacheManager: CacheManager?
    
    @Published var showActions: Bool = false
    @Published var isFavorite: Bool = false
    @Published var contentLabels: [DetailsLabel] = []
    @Published var headerData: HeaderData?
    
    let contentData: ContentDetailsData
    
    init(contentData: ContentDetailsData) {
        self.contentData = contentData
    }
}

//MARK: Public methods

extension DetailsViewModel: DetailsViewModelProtocol {
    func handle(_ action: DetailsModel.Action) {
        switch action {
        case .fetchData:
            fetchContent()
        case .toggleFavorite:
            updateFavorite(!isFavorite)
        case .startWatching:
            break
        }
    }
    
    var backdropPath: String? {
        return contentData.backdropPath
    }
    
    var overview: String? {
        return contentData.overview
    }
    
    var favoriteTitle: String {
        switch isFavorite {
        case true: return Localized.Details.removeFromFavorites
        case false: return Localized.Details.addToFavorites
        }
    }
}

//MARK: Private methods

private extension DetailsViewModel {
    func fetchContent() {
        Task {
            do {
                switch contentData.type {
                case .movie:
                    if let data = try await manager?.getMovieDetails(for: contentData.id) {
                        populateMovie(with: data)
                    }
                case .tv:
                    if let data = try await manager?.getTVDetails(for: contentData.id) {
                        populateTV(with: data)
                    }
                }
            } catch {
                print("Error fetching categories: \(error)")
            }
        }
    }
    
    func populateMovie(with details: MovieDetails) {
        var newLabels: [DetailsLabel] = []
        var header: HeaderData? = nil
        
        if let title = details.title ?? self.contentData.title {
            let runtime = details.runtime?.formatToHoursAndMinutes
            let released = details.releaseDate?.formattedToDotDate
            let tagline = details.tagline
            let genres = details.formattedGenres
            header = .init(title: title, runtime: runtime, released: released, tagline: tagline, genres: genres)
        }

        if let overview = contentData.overview {
            newLabels.append(.init(content: overview, textStyle: .headline))
        }

        display(header: header, details: newLabels)
    }
    
    func populateTV(with details: TVDetails) {
        var newLabels: [DetailsLabel] = []
        var header: HeaderData? = nil
        
        if let title = details.name ?? self.contentData.title {
            var released: String? = nil
            if let date = details.firstAirDate, let formattedDate = date.formattedToDotDate {
                released = Localized.Details.firstAired(formattedDate)
            }
            let genres = details.formattedGenres
            let tagline = details.tagline
            header = .init(title: title, runtime: nil, released: released, tagline: tagline, genres: genres)
        }
        
        if let overview = contentData.overview {
            newLabels.append(.init(content: overview, textStyle: .headline))
        }
        
        if let num = details.numberOfSeasons {
            newLabels.append(.init(content: Localized.Details.numberOfSeasons(num), textStyle: .body, multilineAlignment: .leading))
        }
        
        if let num = details.numberOfEpisodes {
            newLabels.append(.init(content: Localized.Details.numberOfEpisodes(num), textStyle: .body, multilineAlignment: .leading))
        }
        
        display(header: header, details: newLabels)
    }
    
    func display(header: HeaderData?, details: [DetailsLabel]) {
        DispatchQueue.main.async {
            withAnimation(.easeIn(duration: 0.8)) {
                self.isFavorite = self.cachedIsFavorite
                self.headerData = header
                self.contentLabels = details
                self.showActions = true
            }
        }
    }
    
    func updateFavorite(_ bool: Bool) {
        switch bool {
        case true:
            cacheManager?.setFavorite(contentData)
        case false:
            cacheManager?.removeFavorite(contentData)
        }
        
        isFavorite = cachedIsFavorite
    }
    
    var cachedIsFavorite: Bool {
        return cacheManager?.getFavorite(for: contentData.id, type: contentData.type) != nil
    }
}

//MARK: Helper models

extension DetailsViewModel {
    struct HeaderData {
        let title: String
        let runtime: String?
        let released: String?
        let tagline: String?
        let genres: String?
    }

    class DetailsLabel {
        let id = UUID()
        let content: String?
        let textStyle: MPFontType
        let multilineAlignment: TextAlignment
        
        init(content: String?, textStyle: MPFontType, multilineAlignment: TextAlignment = .center) {
            self.content = content
            self.textStyle = textStyle
            self.multilineAlignment = multilineAlignment
        }
    }
}
