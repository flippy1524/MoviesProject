//
//  BaseDetails.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 15.4.25.
//

import Foundation



class BaseDetails: Decodable {
    let id: Int
    let productionCompanies: [ProductionCompany]?
    let tagline: String?
    let genres: [ContentGenre]?

    enum CodingKeys: String, CodingKey {
        case id
        case productionCompanies = "production_companies"
        case tagline
        case genres
    }

    init(id: Int, productionCompanies: [ProductionCompany]?, tagline: String?, genres: [ContentGenre]?) {
        self.id = id
        self.productionCompanies = productionCompanies
        self.tagline = tagline
        self.genres = genres
    }


    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            id: try container.decode(Int.self, forKey: .id),
            productionCompanies: try container.decodeIfPresent([ProductionCompany].self, forKey: .productionCompanies),
            tagline: try container.decode(String.self, forKey: .tagline),
            genres: try container.decodeIfPresent([ContentGenre].self, forKey: .genres)
        )
    }
}


struct ProductionCompany: Decodable {
    let id: Int?
    let name: String?
    let logoPath: String?
    
    enum codingkeys: String, CodingKey {
        case id
        case name
        case logoPath = "logo_path"
    }
}
