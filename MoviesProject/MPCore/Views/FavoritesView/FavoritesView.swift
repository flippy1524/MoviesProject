//
//  FavoritesView.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 16.4.25.
//

import SwiftUI
import MPUtils

struct FavoritesView: View {
    @ObservedObject var viewModel = FavoritesViewModel()
    var body: some View {
        MPNavigationStack {
            Group {
                if viewModel.hasContent {
                    ContentView()
                } else {
                    Text(Localized.Favorites.noFavorites)
                        .textStyle(type: .headline)
                }
            }
            .padding(.vertical, .medium)
            .task {
                viewModel.handle(.fetchFavorites)
            }
            .navigationDestination(item: $viewModel.selectedContent) { content in
                DetailsView(viewModel: .init(contentData: content))
            }
        }
    }
    
    func ContentView() -> some View {
        ScrollView {
            VStack(spacing: 16) {
                if viewModel.hasMovieContent {
                    PosterStackView(title: Localized.Content.movies, contentList: viewModel.movieList, onPosterPressClosure: { content in
                        viewModel.handle(.showDetails(content: content, type: .movie))
                    }, loadNextClosure: nil)
                }
                
                if viewModel.hasTvContent {
                    PosterStackView(title: Localized.Content.tv, contentList: viewModel.tvList, onPosterPressClosure: { content in
                        viewModel.handle(.showDetails(content: content, type: .tv))
                    }, loadNextClosure: nil)
                }
            }
        }
    }
}

#Preview {
    FavoritesView()
}
