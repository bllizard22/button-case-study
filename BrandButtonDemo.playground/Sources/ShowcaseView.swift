import Foundation
import UIKit

public final class ShowcaseView: UIView {

    private lazy var customStyle = CustomButtonStyle(
        normalTitleColor: ColorPalette.trvBrandOrange,
        highlightedTitleColor: ColorPalette.trvBrandOrange,
        normalBackgroundColor: ColorPalette.trvBrandBlue,
        highlightedBackgroundColor: ColorPalette.trvBrandRed
    )

    private let defaultInset: CGFloat = 40
    private let bellIcon = UIImage(systemName: "bell")
    private let starIcon = UIImage(systemName: "star")
    private let starFillIcon = UIImage(systemName: "star.fill")
    private let tapAction: () -> Void = { print("Tapped!") }

    private lazy var greenContainer: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = defaultInset
        return stack
    }()
    private lazy var blueContainer: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = defaultInset
        return stack
    }()

    private let primary: BrandButton = BrandButtonFactory.makeButton()
    private let secondary: BrandButton = BrandButtonFactory.makeButton()
    private let disabled: BrandButton = BrandButtonFactory.makeButton()

    private let primaryBlue: BrandButton = BrandButtonFactory.makeButton()
    private let secondaryBlue: BrandButton = BrandButtonFactory.makeButton()
    private let disabledBlue: BrandButton = BrandButtonFactory.makeButton()

    private let primaryWide: BrandButton = BrandButtonFactory.makeButton()
    private let custom: BrandButton = BrandButtonFactory.makeButton()

    public func setupView() {
        backgroundColor = .white

        [greenContainer, blueContainer, primaryWide, custom].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        [primary, secondary, disabled].forEach {
            greenContainer.addArrangedSubview($0)
        }
        [primaryBlue, secondaryBlue, disabledBlue].forEach {
            blueContainer.addArrangedSubview($0)
        }

        NSLayoutConstraint.activate([
            greenContainer.topAnchor.constraint(equalTo: topAnchor, constant: defaultInset),
            greenContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            greenContainer.trailingAnchor.constraint(equalTo: centerXAnchor),

            blueContainer.topAnchor.constraint(equalTo: greenContainer.topAnchor),
            blueContainer.leadingAnchor.constraint(equalTo: greenContainer.trailingAnchor),
            blueContainer.trailingAnchor.constraint(equalTo: trailingAnchor),

            primaryWide.topAnchor.constraint(equalTo: greenContainer.bottomAnchor, constant: defaultInset),
            primaryWide.centerXAnchor.constraint(equalTo: centerXAnchor),

            custom.topAnchor.constraint(equalTo: primaryWide.bottomAnchor, constant: defaultInset),
            custom.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        setupButtons()
    }

    private func setupButtons() {
        primary.configure(with: .init(
            title: "Primary",
            style: .primary(.green),
            tapAction: tapAction
        ))
        secondary.configure(with: .init(
            title: "Secondary",
            style: .secondary(.green),
            leadingIcon: starIcon
        ))
        disabled.configure(with: .init(
            title: "Disabled",
            style: .primary(.green),
            trailingIcon: bellIcon,
            isEnabled: false
        ))

        primaryBlue.configure(with: .init(
            title: "Primary",
            style: .primary(.blue),
            tapAction: tapAction
        ))
        secondaryBlue.configure(with: .init(
            title: "Secondary",
            style: .secondary(.blue),
            leadingIcon: starIcon
        ))
        disabledBlue.configure(with: .init(
            title: "Disabled",
            style: .secondary(.blue),
            trailingIcon: bellIcon,
            isEnabled: false
        ))

        primaryWide.configure(with: .init(
            title: "Fullwidth",
            style: .primary(.blue),
            leadingIcon: bellIcon,
            trailingIcon: starFillIcon,
            isFullWidth: true
        ))

        custom.configure(with: .init(
            title: "",
            style: .custom(configure: customStyle),
            leadingIcon: starFillIcon,
            tapAction: tapAction
        ))
        custom.setTitle("Custom style")
    }
}
