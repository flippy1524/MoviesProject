# ThemeManager

Manager for programatically setting and using a design token system, based on Google's [Material Design 3](https://m3.material.io/), but could be adjusted for any type of token system. Has 3 palettes for presenting purposes. 

Functionalities: 
- Works with UIKit and SwiftUI out of the box 
- Can be easily changed per target/user preference 
- Works with native and/or user chosen appearance (light/dark/system)
- Option to set a palette fetched from a backend source instead of hardcoding in the apps 


## UIKit example 
```
titleLabel.textColor = ThemeManager.shared.current.primary //UIColor
```

## SwiftUI examples
Used in a view
```
VStack {
    Text("Example text")
}.background(Color(.surface))
```
Used in default inits for a custom view
```
struct CustomView: View {
    let title: String
    let subtitle: String?
    let background: Color
    
    init(
        title: String,
        subtitle: String? = nil,
        background: Color = Color(.surface)
    ) {
        self.title = title
        self.subtitle = subtitle
        self.background = background
    }
}
```
### Potential improvements 
- Introduce a caching system for a user configured theme
- Write an extension for UIColor to easily access the colors instead of writting the entire manager each time 
