//
//  CustomImageView.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 13.4.25.
//

/*
 This view compiles an imageview from a provided path and the type of image its expected to render.
 
 Functionalities:
 - Caching
 - Rendering a smaller res image prior to loading the full scale one
 - Calculation of which size of image should be used based on the size of the container
 - Very basic animations
 
 Notes:
 - The size calculation is based on this logic
 https://developer.themoviedb.org/docs/image-basics
    Realisticaly, this should be done dynamically with calculations based on the configurations API, as well as calculated and provided by its own manager (ImageManager for example). For simplicity purpose, this is defined here with hardcoded logic based on the latest fetch from the configurations API
 - Logic in functions can be improved to allow better testability
 - View model can be separated in its own file, if enforcing it by some rule
 - Kingfisher somewhat breaks the #Preview logic if its during the "Live preview" mode, would have to be investigated
 - I prefer NOT using "scaleToFill" but i saw that some images are not with the correct scaling, so i adjusted the logic based on that
 */
import SwiftUI
import Kingfisher

struct ContentImageView: View {
    @ObservedObject var viewModel: CustomImageViewModel
    @State var isLoaded = false
    @State var isScaledLoaded = false

    init(viewModel: CustomImageViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            if !isLoaded {
                Rectangle()
                    .tint(Color(.primary))
                    .frame(size: viewModel.size)
                if !viewModel.hasImage {
                    Text(Localized.Default.noImage)
                        .textStyle(type: .body, color: Color(.onPrimary))
                        .padding(.horizontal, .extraExtraSmall)
                }
            }
            if !isLoaded, let url = viewModel.scaledURL {
                KFImage(url)
                    .cacheOriginalImage()
                    .onSuccess({ image in
                        withAnimation(.easeIn) {
                            isScaledLoaded = true
                        }
                    })
                    .resizable()
                    .scaledToFill()
                    .hidden(if: !isScaledLoaded)
                    .frame(size: viewModel.size)
            }
            
            if let url = viewModel.finalURL {
                KFImage(url)
                    .cacheOriginalImage()
                    .onSuccess({ image in
                        withAnimation(.easeIn) {
                            isLoaded = true
                        }
                    })
                    .resizable()
                    .scaledToFill()
                    .hidden(if: !isLoaded)
                    .frame(size: viewModel.size)

            }
        }
        .cornerRadius(viewModel.cornerRadius)
    }
}

class CustomImageViewModel: ObservableObject {
    
    fileprivate let path: String?
    fileprivate let type: ImageType
    let size: CGSize
    fileprivate let baseURL = "https://image.tmdb.org/t/p/"
    fileprivate var scaleFactor: CGFloat = 3

    init(path: String?, type: ImageType, size: CGSize) {
        self.path = path
        self.type = type
        self.size = size
    }
    
    var hasImage: Bool {
        path != nil
    }
    
    var scaledURL: URL? {
        guard let path = path else { return nil }
        let imageSize = sizeSegment(for: size.width / scaleFactor, in: type.sizes)
        guard imageSize != "original" else { return nil }
        let string = compileUrl(with: size.width, path: path)
        return URL(string: string)
    }
    
    var finalURL: URL? {
        guard let path = path else { return nil }
        let string = compileUrl(with: size.width, path: path)
        return URL(string: string)
    }
    
    var cornerRadius: MPCornerRadius {
        return type.cornerRadius
    }
    
    fileprivate func compileUrl(with width: CGFloat, path: String) -> String {
        let imageSize = sizeSegment(for: width, in: type.sizes)
        return baseURL + imageSize + path
    }
    
    fileprivate func sizeSegment(for width: CGFloat, in array: [CGFloat]) -> String {
        if isWidthLargerThanAll(width, in: array) {
            return "original"
        }
        let size = Int(closestValueAbove(width, in: array))
        return "w\(size)"
    }
    
    fileprivate func closestValueAbove(_ width: CGFloat, in array: [CGFloat]) -> CGFloat {
        let above = array.filter { $0 >= width }
        return above.min(by: { abs($0 - width) < abs($1 - width) }) ?? array.max()!
    }
    
    fileprivate func isWidthLargerThanAll(_ width: CGFloat, in array: [CGFloat]) -> Bool {
        return array.allSatisfy { width > $0 }
    }

    enum ImageType {
        case poster
        case backdrop
        
        var sizes: [CGFloat] {
            switch self {
            case .poster:
                return [92, 154, 200, 292, 342, 500, 780]
            case .backdrop:
                return [300, 780, 1280]
                
            }
        }
        
        var cornerRadius: MPCornerRadius {
            switch self {
            case .poster:
                //TODO: Maybe make this modular based on the size to fit appropriately?
                return .small
            case .backdrop:
                return .none
            }
        }
    }
}

#Preview {
    ContentImageView(viewModel: .init(path: PreviewData.Poster.posterPath, type: .poster, size: .init(width: 200, height: 600)))
}
