//
//  Utils+Geometry.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//

import UIKit

//There is hardcoded logic here to calculate the size of the card based on the screen itself, i am not a fan of how this is written, it should be more modular. Also include more options for tvOS or whatever


func sizeForWidth(_ width: CGFloat, aspectRatio: CGFloat) -> CGSize {
    let height = width / aspectRatio
    return CGSize(width: width, height: height)
}

func posterCardWidth(with spacing: CGFloat) -> CGFloat {
    
    let viewsPerScreen: CGFloat
    switch (isIphone, isDeviceInLandscape) {
    case (true, true): viewsPerScreen = 6.2     // iPhone landscape
    case (true, false): viewsPerScreen = 2.2    // iPhone portrait
    case (false, true): viewsPerScreen = 8.2    // iPad landscape
    case (false, false): viewsPerScreen = 5.2   // iPad portrait
    }
    
    let totalSpacing = spacing * (viewsPerScreen - 1)
    let availableWidth = UIScreen.main.bounds.width - totalSpacing - (spacing * 4)
    return availableWidth / viewsPerScreen
}



