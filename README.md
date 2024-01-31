# BrandButton Case Study

### Requirements:
✅ The button should follow the design and the specifications represented in the Figma file.

✅ The button should contain the follow colour variations:
    - Green Primary / Secondary
    - Blue Primary / Secondary
    - Disabled (Green or Blue) Primary / Secondary

✅ Ensure that the button responds appropriately to the following states:
    - Default: Standard appearance
    - Pressed: Visually indicate that the button is pressed
    - Disabled: Same appearance for both Blue or Green colour variations
    
✅ The button should be easy to use anywhere in the code. Provide a demo as well as clear instructions on how to instantiate and use the BrandButton in a view. - [Instruction here](#how-to-use)

**Bonus:**

✅ Allow customisation of the button's appearance, such as colour, font, images, for each button state.

✅ Implement animations for state transitions (e.g., fading in/out).

☑️ Allow using the button in both UIKit and SwiftUI.
    
    Faced some layout issues with SwiftUI wrapper

## Solution

<h3 id="how-to-use">How to Use Component</h3>
1. Create default empty button by calling static factory method

```swift
let button = BrandButtonFactory.makeButton()
```
Then configure it's appearance

```swift
let viewModel: BrandButton.ViewModel
button.configure(with: viewModel)
```

Where BrandButton.ViewModel has following types and default values according to specification in Figma:
```swift
var title: String
var style: BrandButtonStyle
var leadingIcon: UIImage? = nil
var trailingIcon: UIImage? = nil
var isEnabled: Bool = true
var isFullWidth: Bool = false
var tapAction: (() -> Void)? = nil
```

Title text can also be set from dedicated method
```swift
button.setTitle("Some new text")
```

2. Factory can be extended for frequently reused combination of style and text to remove boilerplate lines:
```swift
let agreeButton = BrandButtonFactory.makeAgreeButton(tapAction: {
    // some agree tap handler
})
let moreInfoButton = BrandButtonFactory.makeInfoButton(tapAction: {
    // some info tap handler
})
```
This will create (implementation can be tuned to use with LocalizedString):
- Green Primary button with title text *"Agree"*
- Blue Secondary button with title text *"More Info"* and leading icon image

<img width="350" alt="image" src="https://github.com/bllizard22/button-case-study/assets/37974438/085a0281-e081-4018-86af-9bb496d041ab">

------

### Quick start guide
For quick-check the code described below you can launch `BrandButtonDemo.playground`.
You can toggle `needToUseUIKit` flag to switch UIKit and SwiftUI-wrapper implementations.

<img width="350" alt="image" src="https://github.com/bllizard22/button-case-study/assets/37974438/b4c36cae-a90b-4851-a28b-7f112ab69a49">


------

### File Structure
- `BrandButton` - custom reusable button based on UIButton with title, leading and trailing images:
    - Can strech to parent view or compress to subviews content size with `isFullWidth` flag
    - Has short transition animation (0.15s) between `.normal` and `.highlighted` states
    - Is accessibility element and submits current text to VoiceOver

- `BrandButtonStyle` - enum responsible for storing component's styles for various states:
    - Green / Blue
    - Primary / Secondary
    - Default / Pressed / Disabled
    - Custom appearance

- `BrandButtonViewModel` - model of view to configure component appearance. Even though this model is named such way it doesn't require to use only with MVVM and can be applied to any application architecture.

- `BrandButtonFactory` - factory struct for component creation.

- `ColorPalette` - short implementation of solution for reusable color styles.

- `ShowcaseView` - demo container view to showcase component styles and states.

- `ShowcaseSwiftUI` - view to demonstrate usage in SwiftUI (stuck a little bit here with using correct intrinsic size).
