# MoviesProject
A basic example of a Netflix equivalent project using themoviedb's database 
https://developer.themoviedb.org/docs/getting-started

It uses the guest functionality as a base to fetch the data from the API 

# Core features
- Different environments based on scheme selection
- Securely kept urls, tokens etc in info.plist
- Natively written networking
- Using async await for concurrency
   - Both parallel and asynchronous queries 
- Service based access to managers
- SwiftUI based components
- Different layouts based on device size/orientation/type
- ThemeManager for color management
   - Able to import multiple palletes
   - Easy change of theme per target
- Image caching via Kingfisher
- Enum based localization
- Settings screen for debugging

# Todo's
- Add prefetching by adding a splash screen and navigate the user to the correct page with prefetched data
- Cache the content instead of fetching it from the endpoints (SwiftData)
