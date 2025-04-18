//
//  HomeView.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 13.4.25.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    var body: some View {
        MPNavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.homeContentList, id: \.category) { homeContent in
                        PosterStackView(title: homeContent.title, contentList: homeContent.contentList) { movie in
                            viewModel.handle(.showDetails(movie: movie))
                        } loadNextClosure: {
                            viewModel.handle(.fetchNextPage(for: homeContent))
                        }
                    }
                }
            }
            .padding(.vertical, .medium)
            .task {
                viewModel.handle(.fetchCategories)
            }
            .navigationDestination(item: $viewModel.selectedMovie) { movie in
                DetailsView(viewModel: .init(contentData: movie))
            }
        }
    }
}

#Preview {
    HomeView()
}
