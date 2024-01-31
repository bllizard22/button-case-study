import UIKit
import PlaygroundSupport

// Toggle this flag to show view wrapped for SwiftUI
let needToUseUIKit: Bool = true

if needToUseUIKit {
    let showcaseView = ShowcaseView()
    showcaseView.frame = CGRect(x: 0, y: 0, width: 375, height: 560)
    showcaseView.setupView()

    PlaygroundPage.current.setLiveView(showcaseView)
} else {

    // Stuck a little bit here with using view intrinsic size
    let view = ShowcaseSwiftUI()

    PlaygroundPage.current.setLiveView(view)
}
