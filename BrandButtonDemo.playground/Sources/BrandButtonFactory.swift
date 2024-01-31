import Foundation
import UIKit

public struct BrandButtonFactory {
    public static func makeButton() -> BrandButton {
        BrandButton(frame: .zero)
    }

    // Examples of specific factory methods for frequent cases

    public static func makeAgreeButton(tapAction: @escaping () -> Void) -> BrandButton {
        let button = BrandButton(frame: .zero)
        button.configure(with: .init(
            title: SomeTextProvider.agree,
            style: .primary(.green),
            tapAction: tapAction
        ))
        return button
    }

    public static func makeInfoButton(tapAction: @escaping () -> Void) -> BrandButton {
        let button = BrandButton(frame: .zero)
        button.configure(with: .init(
            title: SomeTextProvider.moreInfo,
            style: .secondary(.blue),
            leadingIcon: SomeImageProvider.infoImage,
            tapAction: tapAction
        ))
        return button
    }
}

// MARK: - Stubs of text and image providers

enum SomeTextProvider {
    static let agree = "Agree"
    static let moreInfo = "More Info"
}

enum SomeImageProvider {
    static let infoImage = UIImage(systemName: "info.circle")
}
