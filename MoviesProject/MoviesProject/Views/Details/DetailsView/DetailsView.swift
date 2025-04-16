//
//  DetailsView.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 15.4.25.
//
/*
 Incorporates UI for various devices and rotations. Displays relevant information based on the content type. Reuses the UI models as much as possible so it ends up will less bloater code.
 
 Note: The rotation of the UI does not work properly on iPad. Cannot find a reason why.
 */

import SwiftUI

struct DetailsView: View {
    
    @StateObject var viewModel: DetailsViewModel
    @State var backdropSize: CGSize = .zero
    
    init(viewModel: DetailsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        MPNavigationStack {
            Group {
                switch isIphone {
                case true where isDeviceInLandscape:
                    LandscapeView()
                case true where !isDeviceInLandscape:
                    PortraitView()
                    default:
                    LargeDeviceView()
                        .id(backdropSize)
                }
            }
            .toolbar(.hidden, for: .tabBar)
            .toolbarBackground(.hidden, for: .navigationBar)
            .scrollContentBackground(.hidden)
            .onRotate() {
                updateLayout()
            }
            .task {
                viewModel.handle(.fetchData)
            }
        }
        
    }
    
    func updateLayout() {
        let height: CGFloat
        let width: CGFloat
        
        switch isIphone {
        case true:
            switch isDeviceInLandscape {
            case false:
                height = UIScreen.main.bounds.height / 3
                width = UIScreen.main.bounds.width
            case true:
                height = UIScreen.main.bounds.height
                width = UIScreen.main.bounds.width / 2
            }
        case false :
            height = UIScreen.main.bounds.height / 3
            width = UIScreen.main.bounds.width
        }
        backdropSize = .init(width: width, height: height)
    }
    
    func PortraitView() -> some View {
        ScrollView {
            VStack {
                HeaderView()
                ContentView()
            }
        }
    }
    
    func LandscapeView() -> some View {
        HStack {
            HeaderView()
                .ignoresSafeArea(edges: .top)
            ScrollView {
                ContentView()
            }
        }
    }
    
    func HeaderView() -> some View {
        ZStack(alignment: .bottom) {
            HeaderImage()
            VStack(alignment: .leading, spacing: 8) {
                HeaderButtons()
                HeaderContent(alignment: .center)
            }.padding(.horizontal, .medium)
                .padding(.bottom, .medium)
        }.frame(size: backdropSize)
    }
    
    func LargeDeviceView() -> some View {
        ScrollView {
            VStack {
                ZStack(alignment: .bottomLeading) {
                    HeaderImage()
                        .frame(size: backdropSize)
                    HStack(alignment: .bottom) {
                        HeaderContent(alignment: .leading).fixedSize()
                        HeaderButtons()
                        Spacer()
                    }.padding(.horizontal, .medium)
                        .padding(.bottom, .medium)
                }
                
                ContentView()
            }
        }
    }
   
    func HeaderImage() -> some View {
        ContentImageView(viewModel: .init(path: viewModel.backdropPath, type: .backdrop, size: backdropSize))
            .mask(
                   LinearGradient(
                       gradient: Gradient(stops: [
                           .init(color: .clear, location: 0.0),
                           .init(color: .black, location: 0.1),
                           .init(color: .black, location: 0.9),
                           .init(color: .clear, location: 1.0)
                       ]),
                       startPoint: .top ,
                       endPoint: .bottom
                   )
               )
    }
    
    func HeaderContent(alignment: HorizontalAlignment) -> some View {
        Group {
            if let headerData = viewModel.headerData {
                VStack(alignment: alignment, spacing: 4) {
                    if let runtime = headerData.runtime {
                        HStack {
                            Text(runtime)
                                .textStyle(type: .footnote)
                            if let released = headerData.released {
                                Text(released)
                                    .textStyle(type: .footnote)
                            }
                        }
                    }
                    
                    if let genres = headerData.genres {
                        Text(genres)
                            .textStyle(type: .footnote)
                    }
                    
                    Text(headerData.title)
                        .textStyle(type: .title1)
                        .multilineTextAlignment(.center)
                    
                    if let tagline = headerData.tagline {
                        Text(tagline)
                            .textStyle(type: .body2)
                            .multilineTextAlignment(.center)
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.all, .medium)
            }
        }
        .background(Color(.surface).opacity(0.9))
        .cornerRadius(.extraLarge)
    }
    
    func HeaderButtons() -> some View {
        HStack {
                if viewModel.showActions {
                    
                    MPButton(title: "Add to favorites", style: .primary, size: .small) {
                        print("add to favorites")
                        
                    }.fixedSize()
                    MPButton(title: "Start watching", style: .primary, size: .small) {
                        print("start watching")
                    }.fixedSize()
                }
            }
    }
    
    
    func ContentView() -> some View {
        VStack(spacing: 4) {
            ForEach(viewModel.contentLabels, id: \.id) { label in
                
                if let content = label.content {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(content)
                            .textStyle(type: label.textStyle)
                            .multilineTextAlignment(label.multilineAlignment)
                    }
                    .padding(.all, .medium)
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .background(Color(.surface))
        .cornerRadius(.extraExtraLarge)
        .padding(.horizontal, .medium)
    }
}

class DetailsViewModel: ObservableObject {
    @Service var manager: ContentManager?
    @Published var showActions: Bool = false
    @Published var contentLabels: [DetailsLabel] = []
    @Published var headerData: HeaderData?
    
    let contentData: ContentDetailsData
    
    init(contentData: ContentDetailsData) {
        self.contentData = contentData
    }
    
    func handle(_ action: DetailsModel.Action) {
        switch action {
        case .fetchData:
            fetchContent()
        case .addToFavorites(_):
            break
        case .startWatching:
            break
        }
    }
    
    private func fetchContent() {
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
    
    private func populateMovie(with details: MovieDetails) {
        var newLabels: [DetailsLabel] = []
        var header: HeaderData? = nil
        
        if let title = details.title ?? self.contentData.title {
            
            let runtime = details.formattedRuntime
            let released = details.releaseDate
            let tagline = details.tagline
            let genres = details.formattedGenres
            
            header = .init(title: title, runtime: runtime, released: released, tagline: tagline, genres: genres)
        }

        if let overview = contentData.overview {
            newLabels.append(.init(content: overview, textStyle: .headline))
        }

        display(header: header, details: newLabels)
    }
    
    private func populateTV(with details: TVDetails) {
        var newLabels: [DetailsLabel] = []
        var header: HeaderData? = nil
        
        if let title = details.name ?? self.contentData.title {
            let released = details.formattedAirDate
            let genres = details.formattedGenres
            let tagline = details.tagline

            header = .init(title: title, runtime: nil, released: released, tagline: tagline, genres: genres)
        }
        
        if let overview = contentData.overview {
            newLabels.append(.init(content: overview, textStyle: .headline))
        }
        
        if let num = details.numberOfSeasons {
            newLabels.append(.init(content: "Seasons: \(num)", textStyle: .body, multilineAlignment: .leading))
        }
        
        if let num = details.numberOfEpisodes {
            newLabels.append(.init(content: "Episodes: \(num)", textStyle: .body, multilineAlignment: .leading))
        }
        
        display(header: header, details: newLabels)
    }
    
    private func display(header: HeaderData?, details: [DetailsLabel]) {
        DispatchQueue.main.async {
            withAnimation(.easeIn(duration: 0.8)) {
                self.headerData = header
                self.contentLabels = details
                self.showActions = true
            }
        }
    }
    
    var backdropPath: String? {
        return contentData.backdropPath
    }
    
    var overview: String? {
        return contentData.overview
    }
    
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

enum DetailsModel {
    enum Action {
        case fetchData
        case addToFavorites(Bool)
        case startWatching
    }
}

#Preview {
    DetailsView(viewModel: .init(contentData: .init(id: 23, type: .movie, title: PreviewData.Poster.title, posterPath: PreviewData.Poster.posterPath, backdropPath: PreviewData.Poster.backdropPath, overview: PreviewData.Poster.overview)))
}
