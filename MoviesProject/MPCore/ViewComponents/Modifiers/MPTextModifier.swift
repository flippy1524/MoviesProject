//
//  MPTextModifier.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//


import SwiftUI


struct MPTextModifier : ViewModifier {
    let color: Color
    let font: MPFontType
  
    init(font: MPFontType, color: Color = Color(.onSurface)) {
        self.color = color
        self.font = font
    }
    
    func body(content: Content) -> some View {
        content
            .font(font.font)
            .foregroundColor(color)
    }
}


struct MPTextStyle: ViewModifier {
    let font: MPFontType
    let color: Color
    let staticHeight: Bool
    let staticHeightAlignment: Alignment
    let lines: Int?
    // TODO: add accessability formatting here if necessary

    func body(content: Content) -> some View {
        content
            .font(font.font)
            .foregroundStyle(color)
            .lineLimit(lines)
            .if(canApplyStaticHeight) { view in
                ZStack(alignment: staticHeightAlignment) {
                    view
                        .frame(maxHeight: .infinity, alignment: .bottom)
                }
                .frame(height: staticHeight(for: font, lines: lines))
            }
    }
    
    var canApplyStaticHeight: Bool {
        return staticHeight && lines != nil
    }
    
    private func staticHeight(for font: MPFontType, lines: Int?) -> CGFloat {
        guard let lines = lines else { return 0 }
        let fontHeight = font.uiFont.lineHeight
        let lineSpacing: CGFloat = 1
        return fontHeight * CGFloat(lines) + lineSpacing * CGFloat(lines - 1)
    }
}

extension View {
    public func textStyle(type: MPFontType, lines: Int? = nil, color: Color? = nil, staticHeight: Bool = false, staticHeightAlignment: Alignment = .center) -> some View {
        self.modifier(MPTextStyle(font: type, color: color ?? type.attributes.defaultColor, staticHeight: staticHeight, staticHeightAlignment: staticHeightAlignment, lines: lines))
    }
}
