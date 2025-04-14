//
//  ThemePalette.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//

import Foundation
import UIKit

public enum ThemePalette {
    case app1
    case app2
    case app3
    case custom(tokens: PaletteTokens)
    
    var tokens: PaletteTokens {
        switch self {
        case .app1:
            return PaletteTokens(
                Primary0: UIColor(hex: 0xFF000000),
                Primary10: UIColor(hex: 0xFF271611),
                Primary20: UIColor(hex: 0xFF4E2C22),
                Primary30: UIColor(hex: 0xFFA05946),
                Primary40: UIColor(hex: 0xFFCC988A),
                Primary50: UIColor(hex: 0xFFD4A89C),
                Primary60: UIColor(hex: 0xFFDBB7AD),
                Primary70: UIColor(hex: 0xFFE2C4BC),
                Primary80: UIColor(hex: 0xFFE9D3CD),
                Primary90: UIColor(hex: 0xFFF1E3DF),
                Primary95: UIColor(hex: 0xFFF7EFED),
                Primary99: UIColor(hex: 0xFFFCF9F8),
                Primary100: UIColor(hex: 0xFFFFFFFF),
                
                Secondary0: UIColor(hex: 0xFF000000),
                Secondary10: UIColor(hex: 0xFF161C1D),
                Secondary20: UIColor(hex: 0xFF2B373B),
                Secondary30: UIColor(hex: 0xFF597178),
                Secondary40: UIColor(hex: 0xFF8CA3AA),
                Secondary50: UIColor(hex: 0xFF9BAFB5),
                Secondary60: UIColor(hex: 0xFFADBDC2),
                Secondary70: UIColor(hex: 0xFFBECBCF),
                Secondary80: UIColor(hex: 0xFFCDD7DA),
                Secondary90: UIColor(hex: 0xFFDFE5E7),
                Secondary95: UIColor(hex: 0xFFEDF1F2),
                Secondary99: UIColor(hex: 0xFFF6F8F8),
                Secondary100: UIColor(hex: 0xFFFFFFFF),
                
                Neutral0: UIColor(hex: 0xFF000000),
                Neutral10: UIColor(hex: 0xFF131111),
                Neutral20: UIColor(hex: 0xFF252322),
                Neutral30: UIColor(hex: 0xFF484342),
                Neutral40: UIColor(hex: 0xFF6D6564),
                Neutral50: UIColor(hex: 0xFF8F8685),
                Neutral60: UIColor(hex: 0xFFB0AAA9),
                Neutral70: UIColor(hex: 0xFFBFBBBA),
                Neutral80: UIColor(hex: 0xFFD1CDCD),
                Neutral90: UIColor(hex: 0xFFDFDDDC),
                Neutral95: UIColor(hex: 0xFFF0EFEF),
                Neutral99: UIColor(hex: 0xFFF8F7F7),
                Neutral100: UIColor(hex: 0xFFFFFFFF),
                
                Error0: UIColor(hex: 0xFF000000),
                Error10: UIColor(hex: 0xFF2B0803),
                Error20: UIColor(hex: 0xFF5B1106),
                Error30: UIColor(hex: 0xFFB1220C),
                Error40: UIColor(hex: 0xFFF1462C),
                Error50: UIColor(hex: 0xFFF36049),
                Error60: UIColor(hex: 0xFFF57D6B),
                Error70: UIColor(hex: 0xFFF79687),
                Error80: UIColor(hex: 0xFFF9AFA4),
                Error90: UIColor(hex: 0xFFFBC9C1),
                Error95: UIColor(hex: 0xFFFCDAD5),
                Error99: UIColor(hex: 0xFFFEEDEA),
                Error100: UIColor(hex: 0xFFFFFFFF)
            )
        case .app2:
            return PaletteTokens(
                Primary0: UIColor(hex: 0xFF000000),
                     Primary10: UIColor(hex: 0xFF091D2F),
                     Primary20: UIColor(hex: 0xFF113B5F),
                     Primary30: UIColor(hex: 0xFF2375BE),
                     Primary40: UIColor(hex: 0xFF6CACE4),
                     Primary50: UIColor(hex: 0xFF82B8E8),
                     Primary60: UIColor(hex: 0xFF98C5EC),
                     Primary70: UIColor(hex: 0xFFADD1F0),
                     Primary80: UIColor(hex: 0xFFBEDBF3),
                     Primary90: UIColor(hex: 0xFFD4E7F7),
                     Primary95: UIColor(hex: 0xFFE9F3FB),
                     Primary99: UIColor(hex: 0xFFF6FAFD),
                     Primary100: UIColor(hex: 0xFFFFFFFF),

                     Secondary0: UIColor(hex: 0xFF000000),
                     Secondary10: UIColor(hex: 0xFF001914),
                     Secondary20: UIColor(hex: 0xFF003327),
                     Secondary30: UIColor(hex: 0xFF00664E),
                     Secondary40: UIColor(hex: 0xFF009674),
                     Secondary50: UIColor(hex: 0xFF00C798),
                     Secondary60: UIColor(hex: 0xFF00FFC3),
                     Secondary70: UIColor(hex: 0xFF33FFCF),
                     Secondary80: UIColor(hex: 0xFF66FFDB),
                     Secondary90: UIColor(hex: 0xFF99FFE7),
                     Secondary95: UIColor(hex: 0xFFCCFFF3),
                     Secondary99: UIColor(hex: 0xFFE5FFF9),
                     Secondary100: UIColor(hex: 0xFFFFFFFF),

                     Neutral0: UIColor(hex: 0xFF000000),
                     Neutral10: UIColor(hex: 0xFF161C23),
                     Neutral20: UIColor(hex: 0xFF2D3C48),
                     Neutral30: UIColor(hex: 0xFF5A7790),
                     Neutral40: UIColor(hex: 0xFF9CB0C1),
                     Neutral50: UIColor(hex: 0xFFAABBCA),
                     Neutral60: UIColor(hex: 0xFFB7C5D2),
                     Neutral70: UIColor(hex: 0xFFC7D2DC),
                     Neutral80: UIColor(hex: 0xFFD3DCE4),
                     Neutral90: UIColor(hex: 0xFFE3E8ED),
                     Neutral95: UIColor(hex: 0xFFEFF2F5),
                     Neutral99: UIColor(hex: 0xFFF9FAFB),
                     Neutral100: UIColor(hex: 0xFFFFFFFF),

                     Error0: UIColor(hex: 0xFF000000),
                     Error10: UIColor(hex: 0xFF2B0803),
                     Error20: UIColor(hex: 0xFF5B1106),
                     Error30: UIColor(hex: 0xFFB1220C),
                     Error40: UIColor(hex: 0xFFF1462C),
                     Error50: UIColor(hex: 0xFFF36049),
                     Error60: UIColor(hex: 0xFFF57D6B),
                     Error70: UIColor(hex: 0xFFF79687),
                     Error80: UIColor(hex: 0xFFF9AFA4),
                     Error90: UIColor(hex: 0xFFFBC9C1),
                     Error95: UIColor(hex: 0xFFFCDAD5),
                     Error99: UIColor(hex: 0xFFFEEDEA),
                     Error100: UIColor(hex: 0xFFFFFFFF)
            )
        case .app3:
            return PaletteTokens(
                Primary0: UIColor(hex: 0xFF000000),
                Primary10: UIColor(hex: 0xFF291800),
                Primary20: UIColor(hex: 0xFF523000),
                Primary30: UIColor(hex: 0xFFA35F00),
                Primary40: UIColor(hex: 0xFFF28C00),
                Primary50: UIColor(hex: 0xFFFF9F1A),
                Primary60: UIColor(hex: 0xFFFFB042),
                Primary70: UIColor(hex: 0xFFFFBF66),
                Primary80: UIColor(hex: 0xFFFFD08F),
                Primary90: UIColor(hex: 0xFFFFDFB3),
                Primary95: UIColor(hex: 0xFFFFF0DB),
                Primary99: UIColor(hex: 0xFFFFF7EB),
                Primary100: UIColor(hex: 0xFFFFFFFF),
                
                Secondary0: UIColor(hex: 0xFF000000),
                Secondary10: UIColor(hex: 0xFF00080F),
                Secondary20: UIColor(hex: 0xFF001224),
                Secondary30: UIColor(hex: 0xFF002142),
                Secondary40: UIColor(hex: 0xFF003366),
                Secondary50: UIColor(hex: 0xFF004F9E),
                Secondary60: UIColor(hex: 0xFF006EDB),
                Secondary70: UIColor(hex: 0xFF148AFF),
                Secondary80: UIColor(hex: 0xFF52A8FF),
                Secondary90: UIColor(hex: 0xFF8AC4FF),
                Secondary95: UIColor(hex: 0xFFC7E3FF),
                Secondary99: UIColor(hex: 0xFFE0F0FF),
                Secondary100: UIColor(hex: 0xFFFFFFFF),
                
                Neutral0: UIColor(hex: 0xFF000000),
                Neutral10: UIColor(hex: 0xFF241F1A),
                Neutral20: UIColor(hex: 0xFF473F33),
                Neutral30: UIColor(hex: 0xFF8E7D66),
                Neutral40: UIColor(hex: 0xFFC4BAAD),
                Neutral50: UIColor(hex: 0xFFCCC3B8),
                Neutral60: UIColor(hex: 0xFFD4CDC4),
                Neutral70: UIColor(hex: 0xFFDDD7D0),
                Neutral80: UIColor(hex: 0xFFE5E1DB),
                Neutral90: UIColor(hex: 0xFFEEEBE7),
                Neutral95: UIColor(hex: 0xFFF6F5F3),
                Neutral99: UIColor(hex: 0xFFFBFAF9),
                Neutral100: UIColor(hex: 0xFFFFFFFF),
                
                Error0: UIColor(hex: 0xFF000000),
                Error10: UIColor(hex: 0xFF2B0803),
                Error20: UIColor(hex: 0xFF5B1106),
                Error30: UIColor(hex: 0xFFB1220C),
                Error40: UIColor(hex: 0xFFF1462C),
                Error50: UIColor(hex: 0xFFF36049),
                Error60: UIColor(hex: 0xFFF57D6B),
                Error70: UIColor(hex: 0xFFF79687),
                Error80: UIColor(hex: 0xFFF9AFA4),
                Error90: UIColor(hex: 0xFFFBC9C1),
                Error95: UIColor(hex: 0xFFFCDAD5),
                Error99: UIColor(hex: 0xFFFEEDEA),
                Error100: UIColor(hex: 0xFFFFFFFF)
            )
        case .custom(let tokens):
            return tokens
        }
    }
    
}
