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
}

#Preview {
    DetailsView(viewModel: .init(contentData: .init(id: 23, type: .movie, title: PreviewData.Poster.title, posterPath: PreviewData.Poster.posterPath, backdropPath: PreviewData.Poster.backdropPath, overview: PreviewData.Poster.overview)))
}
