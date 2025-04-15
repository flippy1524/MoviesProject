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
        }.padding(.vertical, .medium)
        .background(Color(.background))
        .task {
            viewModel.handle(.fetchCategories)
        }
    }
}

#Preview {
    HomeView()
}
