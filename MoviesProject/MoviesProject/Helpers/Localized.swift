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
    }
    
    public enum Settings {
        public static var title: String { return "settings.title".localized() }
    }
    
    public enum Default {
        public static var noImage: String { return "default.noImage".localized() }
    }
}
