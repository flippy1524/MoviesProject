//
//  PosterCardView.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 13.4.25.
//
/*
 Poster utilizing some basic information to render a clickable element with optional image and labels
 
 Notes:
 - Based on the latest trend of UI with streaming services and my own opinion, i would NOT build this in mind with using a title and description. But this was an requirement that I assume tests my knowledge of layout to make sure all views look equal
 - Kingfisher somewhat breaks the #Preview logic if its during the "Live preview" mode, would have to be investigated
 - The description could have been something like the genre of the movie
 */

import SwiftUI

struct PosterCardView: View {
    
    @ObservedObject var viewModel: PosterCardViewModel
    
    var body: some View {
        Button(action: {
            viewModel.onPress?()
        }) {
            VStack(alignment: .leading, spacing: 4) {
                if let title = viewModel.title {
                    Text(title)
                        .textStyle(type: .body, lines: 2, staticHeight: true, staticHeightAlignment: .bottom)
                        .multilineTextAlignment(.leading)
                }
                
                ContentImageView(viewModel: .init(path: viewModel.posterPath, type: .poster, size: viewModel.imageSize))
                
                if viewModel.showSubtitle, let overview = viewModel.overview {
                    Text(overview)
                        .textStyle(type: .body2, lines: 2, staticHeight: true, staticHeightAlignment: .top)
                        .multilineTextAlignment(.leading)

                }
            }
        }.frame(width: viewModel.imageSize.width)
    }
}

class PosterCardViewModel: ObservableObject {
    private let data: PosterCardData
    var onPress: FunctionClosure?
    let cardSpacing: CGFloat
    let showSubtitle: Bool
    @Published var imageSize: CGSize = .init(width: 200, height: 300)
    
    init(data: PosterCardData, cardSpacing: CGFloat = 16, showSubtitle: Bool = true, onPress: FunctionClosure? = nil) {
        self.data = data
        self.cardSpacing = cardSpacing
        self.showSubtitle = showSubtitle
        self.onPress = onPress
        calculateSize()
    }
    
    var posterPath: String? {
        data.posterPath
    }
    
    var title: String? {
        data.title
    }
    
    var overview: String? {
        data.overview
    }
    
    private func calculateSize() {
        imageSize = sizeForWidth(posterCardWidth(with: cardSpacing), aspectRatio: 2/3)
    }
}

#Preview {
    let view = PosterCardView(viewModel: .init(data: .init(id: 1, title: PreviewData.Poster.title, posterPath: PreviewData.Poster.posterPath, overview: PreviewData.Poster.overview), onPress: {
        print("poster tapped")
    }))
    
    HStack(spacing: 16) {
        view
        view
    }
}
