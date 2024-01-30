import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {

    private lazy var customStyle = CustomButtonStyle(
        normalTitleColor: ColorPalette.trvBrandOrange,
        highlightedTitleColor: ColorPalette.trvBrandOrange,
        normalBackgroundColor: ColorPalette.trvBrandBlue,
        highlightedBackgroundColor: ColorPalette.trvBrandRed
    )

    private let defaultInset: CGFloat = 40
    private let bellIcon = UIImage(systemName: "bell")
    private let starIcon = UIImage(systemName: "star.fill")
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

    private let primary: BrandButton = BrandButton.makeButton()
    private let secondary: BrandButton = BrandButton.makeButton()
    private let disabled: BrandButton = BrandButton.makeButton()

    private let primaryBlue: BrandButton = BrandButton.makeButton()
    private let secondaryBlue: BrandButton = BrandButton.makeButton()
    private let disabledBlue: BrandButton = BrandButton.makeButton()

    private let primaryWide: BrandButton = BrandButton.makeButton()
    private let custom: BrandButton = BrandButton.makeButton()

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        view.frame = CGRect(x: 0, y: 0, width: 400, height: 500)
        
        self.view = view
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        [greenContainer, blueContainer, primaryWide, custom].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        [primary, secondary, disabled].forEach {
            greenContainer.addArrangedSubview($0)
        }
        [primaryBlue, secondaryBlue, disabledBlue].forEach {
            blueContainer.addArrangedSubview($0)
        }

        NSLayoutConstraint.activate([
            greenContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: defaultInset),
            greenContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            greenContainer.trailingAnchor.constraint(equalTo: view.centerXAnchor),

            blueContainer.topAnchor.constraint(equalTo: greenContainer.topAnchor),
            blueContainer.leadingAnchor.constraint(equalTo: greenContainer.trailingAnchor),
            blueContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            primaryWide.topAnchor.constraint(equalTo: greenContainer.bottomAnchor, constant: defaultInset),
            primaryWide.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            custom.topAnchor.constraint(equalTo: primaryWide.bottomAnchor, constant: defaultInset),
            custom.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        setupButtons()
    }

    private func setupButtons() {
        primary.configure(viewModel: .init(
            title: "Primary",
            style: .primary(.green),
            tapAction: tapAction
        ))
        secondary.configure(viewModel: .init(
            title: "Secondary",
            style: .secondary(.green),
            leadingIcon: starIcon,
            tapAction: tapAction
        ))
        disabled.configure(viewModel: .init(
            title: "Disabled",
            style: .primary(.green),
            trailingIcon: bellIcon,
            isEnabled: false
        ))

        primaryBlue.configure(viewModel: .init(
            title: "Primary",
            style: .primary(.blue),
            tapAction: tapAction
        ))
        secondaryBlue.configure(viewModel: .init(
            title: "Secondary",
            style: .secondary(.blue),
            leadingIcon: starIcon,
            tapAction: tapAction
        ))
        disabledBlue.configure(viewModel: .init(
            title: "Disabled",
            style: .primary(.blue),
            trailingIcon: bellIcon,
            isEnabled: false
        ))

        primaryWide.configure(viewModel: .init(
            title: "Fullwidth",
            style: .primary(.blue),
            leadingIcon: bellIcon,
            trailingIcon: starIcon,
            isFullWidth: true
        ))

        custom.configure(viewModel: .init(
            title: "",
            style: .custom(configure: customStyle),
            leadingIcon: starIcon,
            tapAction: tapAction
        ))
        custom.setTitle("Custom style")
    }
}

PlaygroundPage.current.liveView = MyViewController()
