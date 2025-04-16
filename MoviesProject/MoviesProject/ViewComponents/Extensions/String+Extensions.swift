//
//  String+Extensions.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//

import Foundation

public extension String {
    
    ///Very basic implementation, but can be easily replaced with anything else  if the logic is needed
    func localized() -> String {
        NSLocalizedString(self, comment: "")
    }
    
    func localized(with arguments: CVarArg...) -> String {
        let stringArgs = arguments.map { String(describing: $0) } as [CVarArg]
        return String(format: self.localized(), arguments: stringArgs)
    }
}
