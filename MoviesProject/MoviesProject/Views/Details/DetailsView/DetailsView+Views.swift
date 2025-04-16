//
//  DetailsView+Views.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 16.4.25.
//
/*
 Divided the views into smaller chunks and in a separate file for better readability. Could have potentially built these with
 */
import SwiftUI

extension DetailsView {
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

#Preview {
    DetailsView(viewModel: .init(contentData: .init(id: 23, type: .movie, title: PreviewData.Poster.title, posterPath: PreviewData.Poster.posterPath, backdropPath: PreviewData.Poster.backdropPath, overview: PreviewData.Poster.overview)))
}
