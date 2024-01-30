import Foundation
import UIKit

public final class BrandButton: UIButton {

    public override var isHighlighted: Bool {
        didSet {
            updateColorsIfNeeded(animated: true)
        }
    }

    public override var isEnabled: Bool {
        didSet {
            updateColorsIfNeeded()
        }
    }

    private var buttonStyle: BrandButtonStyle = .primary(.green)
    private var tapHandler: (() -> Void)?
    private var widthConstraint: NSLayoutConstraint?

    private lazy var containerView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .horizontal
        stack.isUserInteractionEnabled = false
        stack.spacing = Constant.containerSpacing
        return stack
    }()

    private lazy var label: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        return label
    }()

    private lazy var leadingImage: UIImageView = {
        let image = UIImageView()
        image.isHidden = true
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = Constant.imageCornerRadius
        return image
    }()

    private lazy var trailingImage: UIImageView = {
        let image = UIImageView()
        image.isHidden = true
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = Constant.imageCornerRadius
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupSubviews()
        setStyle(buttonStyle)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupSubviews() {
        layer.cornerRadius = Constant.buttonCornerRadius
        layer.borderWidth = Constant.borderWidth
        addTarget(self, action: #selector(onTouchUpInside), for: .touchUpInside)

        configStackView()

        isAccessibilityElement = true
        accessibilityTraits = .button
    }

    private func configStackView() {
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false

        [leadingImage, label, trailingImage].forEach {
            containerView.addArrangedSubview($0)
        }

        let width = widthAnchor.constraint(equalToConstant: 10)
        widthConstraint = width
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: Constant.buttonHeight),

            containerView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Constant.containerVerticalInset
            ),
            containerView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Constant.containerHorizontalInset
            ),
            containerView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -Constant.containerHorizontalInset
            ),
            containerView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -Constant.containerVerticalInset
            ),

            leadingImage.widthAnchor.constraint(equalToConstant: Constant.imageSide),
            leadingImage.heightAnchor.constraint(equalTo: leadingImage.widthAnchor),

            trailingImage.widthAnchor.constraint(equalToConstant: Constant.imageSide),
            trailingImage.heightAnchor.constraint(equalTo: trailingImage.widthAnchor)
        ])
    }

    private func setStyle(_ style: BrandButtonStyle) {
        buttonStyle = style
        updateColorsIfNeeded()
    }

    private func updateColorsIfNeeded(animated: Bool = false) {
        if isEnabled && isHighlighted {
            updateColors(for: isHighlighted ? .highlighted : .normal, animated: animated)
        } else {
            updateColors(for: isEnabled ? .normal : .disabled, animated: animated)
        }
    }

    private func updateColors(for state: StyleState, animated: Bool) {
        let titleColor: UIColor
        let background: UIColor

        switch state {
            case .normal:
                titleColor = buttonStyle.normalTitleColor
                background = buttonStyle.normalBackgroundColor
            case .highlighted:
                titleColor = buttonStyle.highlightedTitleColor
                background = buttonStyle.highlightedBackgroundColor
            case .disabled:
                titleColor = buttonStyle.disabledTitleColor
                background = buttonStyle.disabledBackgroundColor
        }

        UIView.animate(withDuration: animated ? 0.15 : 0, delay: 0, options: .curveEaseInOut) {
            self.label.textColor = titleColor
            self.leadingImage.tintColor = titleColor
            self.trailingImage.tintColor = titleColor
            self.backgroundColor = background

            if case .secondary = self.buttonStyle {
                self.layer.borderColor = titleColor.cgColor
            } else {
                self.layer.borderColor = background.cgColor
            }
        }
    }

    @objc private func onTouchUpInside() {
        tapHandler?()
    }
}

// MARK: - ViewModel

extension BrandButton {
    public func configure(with viewModel: ViewModel) {
        if let isEnabled = viewModel.isEnabled {
            self.isEnabled = isEnabled
        }

        setTitle(viewModel.title)

        leadingImage.isHidden = viewModel.leadingIcon == nil
        leadingImage.image = viewModel.leadingIcon
        trailingImage.isHidden = viewModel.trailingIcon == nil
        trailingImage.image = viewModel.trailingIcon

        tapHandler = viewModel.tapAction

        setStyle(viewModel.style)

        widthConstraint?.isActive = viewModel.isFullWidth == true
        if let width = superview?.frame.width {
            widthConstraint?.constant = width
        }
    }

    public func setTitle(_ text: String) {
        let title = NSAttributedString(string: text, attributes: makeAttributes())
        label.attributedText = title
        accessibilityLabel = text
    }

    private func makeAttributes() -> [NSAttributedString.Key: Any] {
        var attributes: [NSAttributedString.Key: Any] = [:]

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.maximumLineHeight = 18

        attributes[.paragraphStyle] = paragraphStyle
        attributes[.font] = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight(700))

        return attributes
    }
}

// MARK: - Constants

extension BrandButton {
    private enum Constant {
        static let buttonHeight: CGFloat = 44
        static let buttonCornerRadius: CGFloat = 4
        static let borderWidth: CGFloat = 1

        static let containerVerticalInset: CGFloat = 10
        static let containerHorizontalInset: CGFloat = 16
        static let containerSpacing: CGFloat = 12

        static let imageSide: CGFloat = 24
        static let imageCornerRadius: CGFloat = 4
    }

    private enum StyleState {
        case normal
        case highlighted
        case disabled
    }
}
