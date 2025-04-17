//
//  Localized.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//

public enum Localized {
    public enum Category {
        public static var nowPlaying: String { return "category.nowPlaying".localized() }
        public static var topRated: String { return "category.topRated".localized() }
        public static var upcoming: String { return "category.upcoming".localized() }
        public static var popular: String { return "category.popular".localized() }
    }
    
    public enum Home {
        public static var title: String { return "home.title".localized() }
    }
    
    public enum Search {
        public static var title: String { return "search.title".localized() }
        public static var placeholder: String { return "search.placeholder".localized() }
        public static var noResults: String { return "search.noResults".localized() }
    }
    
    public enum Settings {
        public static var title: String { return "settings.title".localized() }
        public static var appearanceSystem: String { return "settings.appearanceSystem".localized() }
        public static var appearanceLight: String { return "settings.appearanceLight".localized() }
        public static var appearanceDark: String { return "settings.appearanceDark".localized() }
    }
    
    public enum Default {
        public static var noImage: String { return "default.noImage".localized() }
        public static var hour: String { return "default.hour".localized() }
        public static var minute: String { return "default.minute".localized() }
        public static var favorites: String { return "default.favorites".localized() }
    }
    
    public enum Content {
        public static var movies: String { return "content.movies".localized() }
        public static var tv: String { return "content.tv".localized() }
    }
    
    public enum Details {
        public static var addToFavorites: String { return "details.addToFavorites".localized() }
        public static var removeFromFavorites: String { return "details.removeFromFavorites".localized() }
        public static var startWatching: String { return "details.startWatching".localized() }
        public static func firstAired(_ arguments: CVarArg...) -> String {
            "details.firstAired".localized(with: arguments)
        }
        public static func numberOfEpisodes(_ arguments: CVarArg...) -> String {
            "details.numberOfEpisodes".localized(with: arguments)
        }
        public static func numberOfSeasons(_ arguments: CVarArg...) -> String {
            "details.numberOfSeasons".localized(with: arguments)
        }
    }
    
    public enum Favorites {
        public static var title: String { return "favorites.title".localized() }
        public static var noFavorites: String { return "favorites.noFavorites".localized() }
    }
}
