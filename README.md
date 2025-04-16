# MoviesProject
A basic example of a Netflix equivalent project using [TMDB's](https://developer.themoviedb.org/docs/getting-started) database 


# Core features
- Home page with different categories to browse
- Search page with selectable search types
- Details page for displaying selected content
- Favorites list (with local caching)

# Technical features
- Different environments based on scheme selection
- Securely kept urls, tokens etc in info.plist
- Protocol based classes with inheritance
- Unit tests for base functionalities
- Natively written networking
- Using async await for concurrency
   - Both parallel and asynchronous queries 
- Service based access to managers
- UI written in SwiftUI, with simple native animations
- Reusable UI components
- Different layouts based on device size/orientation/type
- Token based color system
   - Able to import multiple palletes
   - Easy change of theme per target
   - Can also import tokens remotely
   - User selectable appearance (light/dark/system)
- Image caching mechanism
- Loading of low res images prior to fetching the full size
- Enum based localization
- Settings screen for debugging

# Dependencies
Dependencies are injected via Swift Package Manager
- [Kingfisher](https://github.com/onevcat/Kingfisher) 
- [SwiftLint](https://github.com/realm/SwiftLint)

# Todo's
- Brind down the iOS 18 requirement by building the UI differently (can be easily achieved to iOS 15) 
  - Would have to introduce different navigation (Router)
  - Replace the Tabbar with older methods of tabs 
  - Replace the NavigationView 
- Add prefetching by adding a splash screen and navigate the user to the correct page with prefetched data
- Add an actual good looking spash screen (with animations)
- Framework separation for other builds (tvOS/macOS) 
- Offline mode
  - Caching via CoreData probably? SwiftData is iOS 18
- Details view is buggy when rotating the device on iPad, would have to investigate more
- Add a UIKit equivalent view for code comparison
- Expand further debugging options in the Settings screen
