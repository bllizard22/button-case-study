import Foundation
import SwiftUI
import UIKit

struct BrandButtonSwiftUI: UIViewRepresentable {
    var model: BrandButton.ViewModel

    func makeUIView(context: Context) -> UIView {
        // Create and configure your UIKit view
        let customView = BrandButtonFactory.makeButton()

        return customView

    }

    func updateUIView(_ uiView: UIView, context: Context) {
        guard let button = uiView as? BrandButton else { return }

        button.configure(with: model)
    }
}

public struct ShowcaseSwiftUI: View {
    public init() {}

    public var body: some View {
        BrandButtonSwiftUI(model: BrandButton.ViewModel(
            title: "Primary",
            style: .primary(.green)
        ))
        BrandButtonSwiftUI(model: BrandButton.ViewModel(
            title: "Secondary",
            style: .secondary(.green)
        ))
        BrandButtonSwiftUI(model: BrandButton.ViewModel(
            title: "Primary",
            style: .primary(.blue)
        ))
        BrandButtonSwiftUI(model: BrandButton.ViewModel(
            title: "Secondary",
            style: .secondary(.blue)
        ))
        .frame(width: 250)
    }
}
