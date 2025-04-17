//
//  MPSegmentedPicker.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//


import SwiftUI

struct MPSegmentedPicker<T: Equatable>: View {
    
    let title: String?
    let subtitle: String?
    let items: [T]
    let itemTitle: (T) -> String
    let itemImage: ((T) -> Image)?
    var onChange: (() -> Void)?
    @Namespace private var animation
    @Binding var selectedItem: T
    
    init(items: [T], selection: Binding<T>, title: String? = nil, subtitle: String? = nil, itemTitle: @escaping (T) -> String, itemImage: ( (T) -> Image)? = nil, onChange: (() -> Void)? = nil) {
        self.items = items
        self.itemTitle = itemTitle
        self.itemImage = itemImage
        self.onChange = onChange
        self._selectedItem = selection
        self.title = title
        self.subtitle = subtitle
    }
    

    var body: some View {
        if !items.isEmpty {
            VStack(alignment: .leading, spacing: 8) {
                if hasLabels {
                    VStack(alignment: .leading){
                        if let title = title {
                            Text(title)
                                .textStyle(type: .headline)
                        }
                        if let subtitle = subtitle {
                            Text(subtitle)
                                .textStyle(type: .body)
                        }
                    }
                }
                
                HStack {
                    HStack (spacing: 0) {
                        ForEach(items.indices, id: \.self) { index in
                            Button {
                                if items[index] != selectedItem {
                                    onChange?()
                                }
                                selectedItem = items[index]
                            } label: {
                                if getItem(for: index) == selectedItem {
                                    ButtonContainer(title: title(for: index), image: image(for: index), fontType: .subhead, isSelected: true)
                                } else {
                                    ButtonContainer(title: title(for: index), image: image(for: index), fontType: .body2, isSelected: false)
                                }
                            }
                            
                            if hasDivider(for: index) {
                                
                                Divider().frame(width: 1, height: 12)
                                    .hidden(if: !shouldShowDivider(for: index))
                            }
                        }
                    }
                    .padding(.all, .extraExtraSmall)
                }
                .background(Color(.surface))
                .cornerRadius(.medium)

            }
            .fixedSize(horizontal: false, vertical: false)
            .animation(.spring(), value: UUID())
        }
    }
    
    func ButtonContainer(title: String, image: Image?, fontType: MPFontType, isSelected: Bool) -> some View {
        HStack {
            VStack(spacing: 2) {
                if let image = image {
                    image
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(Color(.onSurfaceVariant))
                        .frame(size: 18)
                }
                
                Text(title)
                    .textStyle(type: fontType)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(Rectangle())
                    
            }.padding(.vertical, 3)
            .padding(.horizontal, 10)
        }.background(content: {
            if isSelected {
                Rectangle()
                    .foregroundStyle(Color(.primaryContainer))
                    .cornerRadius(.small)
                    .shadow(radius: 2)
                    .matchedGeometryEffect(id: "IndicatorAnimationId", in: animation)
            }
        })
    }
    
    var hasLabels: Bool {
        return title != nil || subtitle != nil
    }
    
    func getItem(for index: Int) -> T {
        return items[index]
    }
 
    func title(for index: Int) -> String {
        return itemTitle(getItem(for: index))
    }
    
    func image(for index: Int) -> Image? {
        return itemImage?(getItem(for: index))
    }
    
    func hasDivider(for index: Int) -> Bool {
        return items.count == (index + 1) ? false : true
    }
    
    func shouldShowDivider(for index: Int) -> Bool {
        let item = getItem(for: index)
        
        if item == selectedItem {
            return false
        } else if items.indices.contains(index + 1) {
            let nextItem = getItem(for: index + 1)

            if nextItem == selectedItem {
                return false
            }
        } else if items.count == (index + 1) {
            return false
        }
        return true
    }
}

#Preview {
    let segments = ["Option 1", "Option 2", "Option 3"]
    
    StatefulPreviewWrapper(segments[1]) { binding in
        
        
        MPSegmentedPicker(items: segments, selection: binding, title: "title for picke", subtitle: "subtitle for picker") { item in
            return item
        } itemImage: { item in
            return Image(systemName: "magnifyingglass")
        } onChange: {
            print("item changed")

        }

    }
    
    let segments1 = ["Option 1", "Option 2", "Option 3"]

    StatefulPreviewWrapper(segments1[1]) { binding in
        
        MPSegmentedPicker(items: segments1, selection: binding, title: "Title 2" , subtitle: "subtitle 2") { item in
            return item
        } onChange: {
            print("item changed")
        }
    }
}
