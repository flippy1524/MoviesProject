//
//  CacheManager.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 16.4.25.
//

import Foundation
import SwiftUI
import MPUtils

protocol CacheManaging {
    var tvFavorites: [Int: ContentDetailsData] { get set }
    var movieFavorites: [Int: ContentDetailsData] { get set }
 
    func getFavorite(for id: Int, type: ContentType) -> ContentDetailsData?
    func setFavorite(_ favorite: ContentDetailsData)
    func removeFavorite(_ favorite: ContentDetailsData)
}

public class CacheManager: CacheManaging {
    private let key = Constants.AppStorage.tvFavorites
    private let movieKey = Constants.AppStorage.movieFavorites
    private let defaults: UserDefaults

    public init(defaults: UserDefaults = UserDefaults.standard) {
        self.defaults = defaults
    }
}

//MARK: Public methods

extension CacheManager {
    public var tvFavorites: [Int: ContentDetailsData] {
        get {
            guard let data = defaults.data(forKey: key) else { return [:] }
            return CacheUtils.decode([Int: ContentDetailsData].self, from: data) ?? [:]
        }
        set {
            if let encoded = CacheUtils.encode(newValue) {
                defaults.set(encoded, forKey: key)
            }
        }
    }

    public var movieFavorites: [Int: ContentDetailsData] {
        get {
            guard let data = defaults.data(forKey: movieKey) else { return [:] }
            return CacheUtils.decode([Int: ContentDetailsData].self, from: data) ?? [:]
        }
        set {
            if let encoded = CacheUtils.encode(newValue) {
                defaults.set(encoded, forKey: movieKey)
            }
        }
    }
    
    public func getFavorite(for id: Int, type: ContentType) -> ContentDetailsData? {
        switch type {
        case .movie:
            return movieFavorites[id]
        case .tv:
            return tvFavorites[id]
        }
    }

    public func setFavorite(_ favorite: ContentDetailsData) {
        let id = favorite.id
        switch favorite.type {
        case .movie:
            var favorites = movieFavorites
            favorites[id] = favorite
            movieFavorites = favorites
        case .tv:
            var favorites = tvFavorites
            favorites[id] = favorite
            tvFavorites = favorites
        }
    }
    
    public func removeFavorite(_ favorite: ContentDetailsData) {
        switch favorite.type {
        case .movie:
            movieFavorites.removeValue(forKey: favorite.id)
        case .tv:
            tvFavorites.removeValue(forKey: favorite.id)
        }
    }
}

//MARK: Utility Enum

enum CacheUtils {
    static func decode<T: Decodable>(_ type: T.Type, from data: Data) -> T? {
        return try? JSONDecoder().decode(T.self, from: data)
    }

    static func encode<T: Encodable>(_ value: T) -> Data? {
        return try? JSONEncoder().encode(value)
    }
}
