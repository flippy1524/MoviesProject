//
//  DetailsView.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 15.4.25.
//

import SwiftUI

struct DetailsView: View {
    
    @ObservedObject var viewModel: DetailsViewModel
    @State var backdropSize: CGSize = .zero
    
    var body: some View {
        
        Group {
            switch isDeviceInLandscape {
            case true:
                LandscapeView()
            case false:
                PortraitView()
            }
        }
        .background(Color(.background))
        .toolbar(.hidden, for: .tabBar)
        .toolbarBackground(.hidden, for: .navigationBar)
        .scrollContentBackground(.hidden)
        .onRotate() {
            updateLayout()
        }
    }
    
    func updateLayout() {
        let height = isDeviceInLandscape ? UIScreen.main.bounds.height : UIScreen.main.bounds.height / 3
        let width = isDeviceInLandscape ? UIScreen.main.bounds.width / 2 : UIScreen.main.bounds.width
        backdropSize = .init(width: width, height: height)
    }
    
    func PortraitView() -> some View {
        return ScrollView {
            VStack {
                HeaderView()
                ContentView()
            }
        }
    }
    
    func LandscapeView() -> some View {
        return HStack {
            HeaderView()
            Spacer()
            ScrollView {
                ContentView()
            }
        }
    }
    
    func HeaderView() -> some View {
        return ZStack(alignment: .bottom) {
            ContentImageView(viewModel: .init(path: viewModel.backdropPath, type: .backdrop, size: backdropSize))
                .mask(
                       LinearGradient(
                           gradient: Gradient(stops: [
                               .init(color: .clear, location: 0.0),
                               .init(color: .black, location: 0.1),
                               .init(color: .black, location: 0.9),
                               .init(color: .clear, location: 1.0)
                           ]),
                           startPoint: isDeviceInLandscape ? .top : .leading,
                           endPoint: isDeviceInLandscape ? .bottom : .trailing
                       )
                   )
            
            VStack(spacing: 16) {
                HStack {
                    MPButton(title: "Add to favorites", style: .primary, size: .small) {
                        print("add to favorites")

                    }.fixedSize()
                    MPButton(title: "Start watching", style: .primary, size: .small) {
                        print("start watching")
                    }.fixedSize()
                }
            }.padding(.horizontal, .medium)
                .padding(.bottom, .medium)
        }.frame(size: backdropSize)
    }
    
    func ContentView() -> some View {
        return VStack {
            if let title = viewModel.title {
                Text(title)
                    .textStyle(type: .title1)
            }
            if let overview = viewModel.overview {
                Text(overview)
            }
            Text("title")
            Text("title")
            Text("title")
            Text("title")
            Text("title")
        }.padding(.horizontal, .medium)
    }
}

class DetailsViewModel: ObservableObject {
    let contentData: ContentDetailsData
    
    init(contentData: ContentDetailsData) {
        self.contentData = contentData
    }
    
    var title: String? {
        return contentData.title
    }
    
    var backdropPath: String? {
        return contentData.backdropPath
    }
    
    var overview: String? {
        return contentData.overview
    }
}

#Preview {
    DetailsView(viewModel: .init(contentData: .init(id: 23, type: .movie, title: PreviewData.Poster.title, backdropPath: PreviewData.Poster.backdropPath, overview: PreviewData.Poster.overview)))
}

