import Foundation
import UIKit

public extension BrandButton {
    struct ViewModel {
        public var title: String
        public var style: BrandButtonStyle
        public var leadingIcon: UIImage?
        public var trailingIcon: UIImage?
        public var isEnabled: Bool?
        public var tapAction: (() -> Void)?

        public init(
            title: String,
            style: BrandButtonStyle = .primary,
            leadingIcon: UIImage? = nil,
            trailingIcon: UIImage? = nil,
            isEnabled: Bool? = nil,
            tapAction: (() -> Void)? = nil
        ) {
            self.title = title
            self.style = style
            self.leadingIcon = leadingIcon
            self.trailingIcon = trailingIcon
            self.isEnabled = isEnabled
            self.tapAction = tapAction
        }
    }
}
