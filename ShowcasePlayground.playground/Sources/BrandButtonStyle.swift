import Foundation
import UIKit

public enum BrandButtonStyle {
    case primary
    case secondary
    case custom(configure: CustomButtonStyle)

    // MARK: - Title Color

    public var normalTitleColor: UIColor {
        switch self {
            case .primary:
                return ColorPalette.neutralsWhite
            case .secondary:
                return ColorPalette.trvGreen_700
            case .custom(configure: let configure):
                return configure.normalTitleColor ?? ColorPalette.neutralsWhite
        }
    }

    public var highlightedTitleColor: UIColor {
        switch self {
            case .primary:
                return ColorPalette.neutralsWhite
            case .secondary:
                return ColorPalette.trvGreen_900
            case .custom(configure: let configure):
                if let color = configure.highlightedTitleColor {
                    return color
                } else if let color = configure.normalTitleColor {
                    return color.withAlphaComponent(0.5)
                } else {
                    return ColorPalette.neutralsWhite
                }
        }
    }

    public var disabledTitleColor: UIColor {
        switch self {
            case .primary:
                return ColorPalette.neutralsWhite
            case .secondary:
                return ColorPalette.trvJuri_300
            case .custom(configure: let configure):
                return configure.disabledTitleColor ?? ColorPalette.neutralsWhite
        }
    }

    // MARK: - Background Color

    public var normalBackgroundColor: UIColor {
        switch self {
            case .primary:
                return ColorPalette.trvGreen_700
            case .secondary:
                return ColorPalette.neutralsWhite
            case .custom(configure: let configure):
                return configure.normalBackgroundColor ?? ColorPalette.neutralsWhite
        }
    }

    public var highlightedBackgroundColor: UIColor {
        switch self {
            case .primary:
                return ColorPalette.trvGreen_900
            case .secondary:
                return ColorPalette.trvGreen_100
            case .custom(configure: let configure):
                if let color = configure.highlightedBackgroundColor {
                    return color
                } else if let color = configure.normalBackgroundColor {
                    return color.withAlphaComponent(0.5)
                } else {
                    return ColorPalette.trvGreen_900
                }
        }
    }

    public var disabledBackgroundColor: UIColor {
        switch self {
            case .primary:
                return ColorPalette.trvJuri_300
            case .secondary:
                return ColorPalette.neutralsWhite
            case .custom(configure: let configure):
                return configure.disabledBackgroundColor ?? ColorPalette.trvJuri_300
        }
    }
}

public struct CustomButtonStyle {
    let normalTitleColor: UIColor?
    let highlightedTitleColor: UIColor?
    let disabledTitleColor: UIColor?
    let normalBackgroundColor: UIColor?
    let highlightedBackgroundColor: UIColor?
    let disabledBackgroundColor: UIColor?

    public init(
        normalTitleColor: UIColor? = nil,
        highlightedTitleColor: UIColor? = nil,
        disabledTitleColor: UIColor? = nil,
        normalBackgroundColor: UIColor? = nil,
        highlightedBackgroundColor: UIColor? = nil,
        disabledBackgroundColor: UIColor? = nil
    ) {
        self.normalTitleColor = normalTitleColor
        self.highlightedTitleColor = highlightedTitleColor
        self.disabledTitleColor = disabledTitleColor
        self.normalBackgroundColor = normalBackgroundColor
        self.highlightedBackgroundColor = highlightedBackgroundColor
        self.disabledBackgroundColor = disabledBackgroundColor
    }
}
