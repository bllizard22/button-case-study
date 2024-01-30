import UIKit
import PlaygroundSupport

let view = ShowcaseView()
view.frame = CGRect(x: 0, y: 0, width: 375, height: 500)
view.setupView()

PlaygroundPage.current.setLiveView(view)
