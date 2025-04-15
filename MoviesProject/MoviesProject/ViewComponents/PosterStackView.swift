//
//  PosterStackView.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 13.4.25.
//
/*
    A horizontal poster view with an optional title that provides a closure to load the next content, as well as a tap on the individual elements
 */
import SwiftUI

struct PosterStackView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @State private var isVisible = false
    
    let title: String?
    let contentList: [MPContent]
    let animationDuration: CGFloat
    let showCardSubtitle: Bool
    let onPosterPressClosure: ((MPContent) -> Void)?
    let loadNextClosure: FunctionClosure?
    let cardSpacing: CGFloat = 16

    init(title: String? = nil, contentList: [MPContent], animationDuration: CGFloat = 0.8, showCardSubtitle: Bool = true, onPosterPressClosure: ((MPContent) -> Void)?, loadNextClosure: FunctionClosure?) {
        self.title = title
        self.contentList = contentList
        self.animationDuration = animationDuration
        self.showCardSubtitle = showCardSubtitle
        self.onPosterPressClosure = onPosterPressClosure
        self.loadNextClosure = loadNextClosure
    }

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 4) {
                if let title = title {
                    Text(title)
                        .textStyle(type: .headline)
                        .padding(.horizontal, .medium)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(alignment: .center, spacing: cardSpacing) {
                        ForEach(contentList, id: \.id) { content in
                            PosterCardView(viewModel: .init(data: content.posterData, cardSpacing: cardSpacing, showSubtitle: showCardSubtitle, onPress: {
                                onPosterPressClosure?(content)
                            }))
                            .onAppear {
                                guard isLastElement(content.id) else {
                                    return
                                }
                                loadNextClosure?()
                            }
                            .padding(.trailing, isLastElement(content.id) ? .medium : .zero)
                            .padding(.leading, isFirstElement(content.id) ? .medium : .zero)
                        }
                    }
                }
            }
            .padding(.vertical, .medium)
        }
        .opacity(isVisible ? 1 : 0)
        .offset(y: isVisible ? 0 : 20)
        .animation(.easeIn(duration: animationDuration), value: isVisible)
        .onAppear {
            isVisible = true
        }
        .background(Color(.surface))
        .cornerRadius(.extraExtraLarge)
        .padding(.horizontal, .medium)
    }
    
    func isLastElement(_ id: Int) -> Bool {
        return id == contentList.last?.id
    }
    
    func isFirstElement(_ id: Int) -> Bool {
        return id == contentList.first?.id
    }
}

#Preview {
    
    let content = [PreviewData.Content.movieContent, PreviewData.Content.movieContent, PreviewData.Content.movieContent, PreviewData.Content.movieContent, PreviewData.Content.movieContent, PreviewData.Content.movieContent, PreviewData.Content.movieContent, PreviewData.Content.movieContent, PreviewData.Content.movieContent]
    PosterStackView(title: "Now playing", contentList: content) { id in
        print("tapped", id)
    } loadNextClosure :
    {
        print("load next")
    }
}
