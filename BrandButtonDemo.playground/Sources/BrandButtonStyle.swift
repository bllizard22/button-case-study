import Foundation
import UIKit

public enum BrandButtonStyle {
    public enum Variant {
        case green
        case blue
    }

    case primary(_ variant: Variant)
    case secondary(_ variant: Variant)
    case custom(configure: CustomButtonStyle)

    // MARK: - Title Color

    public var normalTitleColor: UIColor {
        switch self {
            case .primary:
                return ColorPalette.neutralsWhite
            case .secondary(let variant):
                switch variant {
                    case .green:
                        return ColorPalette.trvGreen_700
                    case .blue:
                        return ColorPalette.trvBlue_700
                }
            case .custom(configure: let configure):
                return configure.normalTitleColor ?? ColorPalette.neutralsWhite
        }
    }

    public var highlightedTitleColor: UIColor {
        switch self {
            case .primary:
                return ColorPalette.neutralsWhite
            case .secondary(let variant):
                switch variant {
                    case .green:
                        return ColorPalette.trvGreen_900
                    case .blue:
                        return ColorPalette.trvBlue_900
                }
            case .custom(configure: let configure):
                if let color = configure.highlightedTitleColor {
                    return color
                } else {
                    return (configure.normalTitleColor ?? ColorPalette.neutralsWhite).withAlphaComponent(0.5)
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
            case .primary(let variant):
                switch variant {
                    case .green:
                        return ColorPalette.trvGreen_700
                    case .blue:
                        return ColorPalette.trvBlue_700
                }
            case .secondary:
                return ColorPalette.neutralsWhite
            case .custom(configure: let configure):
                return configure.normalBackgroundColor ?? ColorPalette.neutralsWhite
        }
    }

    public var highlightedBackgroundColor: UIColor {
        switch self {
            case .primary(let variant):
                switch variant {
                    case .green:
                        return ColorPalette.trvGreen_900
                    case .blue:
                        return ColorPalette.trvBlue_900
                }
            case .secondary(let variant):
                switch variant {
                    case .green:
                        return ColorPalette.trvGreen_100
                    case .blue:
                        return ColorPalette.trvBlue_100
                }
            case .custom(configure: let configure):
                if let color = configure.highlightedBackgroundColor {
                    return color
                } else {
                    return (configure.normalBackgroundColor ?? ColorPalette.trvGreen_900).withAlphaComponent(0.5)
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
