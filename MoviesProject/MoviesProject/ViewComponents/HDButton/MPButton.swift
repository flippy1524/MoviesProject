//
//  MPButton.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//

import SwiftUI

struct MPButton: View {
    @ObservedObject private var viewModel: MPButtonViewModel
    var size: MPButtonSize
    var radius: MPCornerRadius
    var imagePadding: CGFloat
    var horizontalPadding: CGFloat
    var buttonTapped: (() -> Void)?
    var buttonLongPressBegin: (() -> Void)?
    var buttonLongPressEnd: (() -> Void)?

    @State private var isPressing = false

    
    init(title: String, style: ButtonStyle, image: Image? = nil, imagePadding: CGFloat = 8, isEnabled: Bool = true, chevronImage: Image? = nil, size: MPButtonSize = .normal, radius: MPCornerRadius = .large, horizontalPadding: CGFloat = 16, longPressBegin: ( () -> Void)? = nil, longPressEnd: ( () -> Void)? = nil, buttonTapped: ( () -> Void)? = nil) {
        self.viewModel = MPButtonViewModel(isEnabled: isEnabled, title: title, image: image, chevronImage: chevronImage, style: style)
        self.buttonTapped = buttonTapped
        self.buttonLongPressBegin = longPressBegin
        self.buttonLongPressEnd = longPressEnd
        self.horizontalPadding = horizontalPadding
        self.radius = radius
        self.size = size
        self.imagePadding = imagePadding
    }
    
    init(title: String, style: ButtonStyle, image: Image? = nil, imagePadding: CGFloat = 8, isEnabled: Bool = true, chevronImage: Image? = nil, size: MPButtonSize = .normal, radius: MPCornerRadius = .large, horizontalPadding: CGFloat = 16, buttonTapped: ( () -> Void)?) {
        self.viewModel = MPButtonViewModel(isEnabled: isEnabled, title: title, image: image, chevronImage: chevronImage, style: style)
        self.buttonTapped = buttonTapped
        self.buttonLongPressBegin = nil
        self.buttonLongPressEnd = nil
        self.horizontalPadding = horizontalPadding
        self.size = size
        self.radius = radius
        self.imagePadding = imagePadding
    }
    
    var body: some View {
        Button {
            self.buttonTapped?()
        } label: {
            VStack(spacing: imagePadding) {
                if let image = viewModel.image {
                    image
                        .renderingMode(.template)
                        .frame(width: 24, height: 24)
                        .foregroundColor(viewModel.isEnabled ? viewModel.style.textColor : viewModel.style.textPressedColor)
                }
                
                HStack(spacing: 8) {
                    Text(viewModel.title)
                        .font(Font.font(with: .body)) // this has to be like this so it doesnt colide with the logic below in the buttonstyle
                        .multilineTextAlignment(.center)
                    if let chevronImage = viewModel.chevronImage {
                        chevronImage
                            .renderingMode(.template)
                            .foregroundColor(viewModel.isEnabled ? viewModel.style.textColor : viewModel.style.textPressedColor)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .contentShape(Rectangle())
            .padding(.horizontal, horizontalPadding)
        }
        .buttonStyle(
            HDButtonStyle(
                isEnabled: viewModel.isEnabled,
                backgrounColor: viewModel.style.backgroundColor,
                backgroundPressedColor: viewModel.style.backgroundPressedColor,
                backgroundDisabledColor: viewModel.style.backgroundDisabledColor,
                textColor: viewModel.style.textColor,
                cornerRadius: radius,
                textPressedColor: viewModel.style.textPressedColor,
                textDisabledColor: viewModel.style.textDisabledColor))
        .overlay(
            RoundedRectangle(cornerRadius: radius.rawValue)
                .stroke(viewModel.isEnabled ? viewModel.style.borderColor : viewModel.style.borderColorDisabled, lineWidth: 1)
            )
        .disabled(!viewModel.isEnabled)
        .frame(height: size.rawValue)
        .onLongPressGesture(
            minimumDuration: 0.5,
                    pressing: { pressing in
                        isPressing = pressing
                        if pressing {
                            buttonLongPressBegin?()
                        } else {
                            buttonLongPressEnd?()
                        }
                    },
                    perform: {
                       buttonLongPressEnd?()
                    }
                )
    }
    
    enum MPButtonSize: CGFloat {
        case extraExtraLarge = 144
        case extraLarge = 98
        case large = 68
        case normal = 56
        case small =  36
    }
}

struct HDButtonStyle: ButtonStyle {
    var isEnabled: Bool
    
    var backgrounColor: Color = Color(.primary)
    var backgroundPressedColor: Color = Color(.primary).opacity(0.8)
    var backgroundDisabledColor: Color = Color(.onSurfaceFocus)
    var textColor: Color  = Color(.primary)
    var cornerRadius: MPCornerRadius
    var textPressedColor: Color = Color(.primary)
    var textDisabledColor: Color  = Color(.onSurface)

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.all, .zero)
            .background(isEnabled ? (configuration.isPressed ? backgroundPressedColor : backgrounColor) : backgroundDisabledColor)
            .foregroundColor((isEnabled ? (configuration.isPressed ? textPressedColor : textColor) : textDisabledColor))
            .cornerRadius(cornerRadius)
    }
}

#Preview {
    MPButton(title: "title textt",style: .primary, isEnabled: true, radius: .medium) {
        print("do something")
    }
}


extension MPButton {
    enum ButtonStyle {
        case primary
        case outlined
        case text
        case tonal
        
        var textColor: Color {
            switch self {
            case .primary:
                return Color(.onPrimary)
            case .outlined:
                return Color(.primary)
            case .text:
                return Color(.primary)
            case .tonal:
                return Color(.onPrimaryContainer)
            }
        }
        
        var textPressedColor: Color {
            switch self {
            case .primary:
                return Color(.onPrimary)
            case .outlined:
                return Color(.primary)
            case .text:
                return Color(.primary)
            case .tonal:
                return Color(.onPrimaryContainer)
            }
        }
        
        var textDisabledColor: Color {
            return Color(.onSurface).opacity(0.38)
        }
        
        
        var backgroundColor: Color {
            switch self {
            case .primary:
                return Color(.primary)
            case .outlined:
                return .clear
            case .text:
                return .clear
            case .tonal:
                return Color(.primaryContainer)
            }
        }
        
        var backgroundPressedColor: Color {
            switch self {
            case .primary:
                return Color(.primary).opacity(0.8)
            case .outlined:
                return Color(.primaryFocus)
            case .text:
                return Color(.primaryFocus)
            case .tonal:
                return Color(.onPrimaryContainer).opacity(0.16)
            }
        }
        
        var backgroundDisabledColor: Color {
            switch self {
            case .primary:
                return Color(.onSurfaceFocus)
            case .outlined:
                return .clear
            case .text:
                return .clear
            case .tonal:
                return Color(.onSurfaceFocus)
            }
        }
        
        var borderColor: Color {
            switch self {
            case .primary:
                return .clear
            case .outlined:
                return Color(.primary)
            case .text:
                return .clear
            case .tonal:
                return .clear
            }
        }
        
        var borderColorDisabled: Color {
            switch self {
            case .primary:
                return .clear
            case .outlined:
                return Color(.onSurfaceFocus)
            case .text:
                return .clear
            case .tonal:
                return .clear
            }
        }
    }
}
