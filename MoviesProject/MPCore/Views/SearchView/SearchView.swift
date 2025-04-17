//
//  SearchView.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//

import SwiftUI
import MPUtils

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    @State var width: CGFloat = 0
    @State var isHorizontal: Bool = false
    @State var showSubtitle: Bool = true

    var body: some View {
        MPNavigationStack {
            VStack {
                SearchView()
                
                Spacer()
                
                if viewModel.showContent {
                    ScrollView {
                        PosterStackView(title: viewModel.title, contentList: viewModel.contentList, showCardSubtitle: showSubtitle) { content in
                            viewModel.handle(.showDetails(content: content))
                        } loadNextClosure: {
                            viewModel.handle(.fetchNextPage)
                        }.fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
            .padding(.top, .small)
            .padding(.bottom, isHorizontal ? .zero : .small)
            .onRotate() {
                updateLayout()
            }
            .navigationDestination(item: $viewModel.selectedContent) { content in
                DetailsView(viewModel: .init(contentData: content))
            }
        }
    }
    
    func SearchView() -> some View {
        return AdaptiveStack(isHorizontal: isHorizontal, spacing: isHorizontal ? 16 : 8) {
            let sharedHeight: CGFloat = 55

            VStack {
                TextField("", text: $viewModel.searchText, prompt: Text(Localized.Search.placeholder))
                    .submitLabel(.search)
                    .padding(.all, .small)
                    .if(!isHorizontal) { view in
                        view.frame(width: textFieldWidth)
                    }.if(isHorizontal) { view in
                        view.frame(height: sharedHeight)
                    }
            }
            .background(Color(.surface))
            .cornerRadius(.medium)

            MPSegmentedPicker(items: viewModel.contentTypes, selection: $viewModel.selectedType) { item in
                return item.title
            } onChange: {
                viewModel.handle(.changedType)
            }
            .if(!isHorizontal) { view in
                view.frame(width: width)
                    .fixedSize(horizontal: false, vertical: true)
            }.if(isHorizontal) { view in
                view.frame(height: sharedHeight)
            }
        }
        .padding(.horizontal, .medium)
    }
         
    func updateLayout() {
        let fullWidth = UIScreen.main.bounds.width
        width =  isIphone ? fullWidth / 2 : fullWidth / 3
        isHorizontal = isIphone && isDeviceInLandscape
        showSubtitle = !(isIphone && isDeviceInLandscape)
    }
    
    var textFieldWidth: CGFloat {
        width + MPPadding.extraLarge.rawValue
    }
}

#Preview {
    SearchView()
}
