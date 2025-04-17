//
//  Utils+Device.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//
import UIKit

var isIphone = UIDevice.current.userInterfaceIdiom == .phone

var isDeviceInLandscape: Bool {
    let screen = UIScreen.main.bounds
    return screen.width > screen.height
}
