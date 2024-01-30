import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {

    private let defaultInset: CGFloat = 24
    private let text = "Base button"
    private let bellIcon = UIImage(systemName: "bell")
    private let starIcon = UIImage(systemName: "star.fill")
    private let tapAction: () -> Void = {
        print("Tapped!")
    }

    private let primary: BrandButton = BrandButton.makeGreenButton()
    private let secondary: BrandButton = BrandButton.makeGreenButton()
    private let disabled: BrandButton = BrandButton.makeGreenButton()
    private let custom: BrandButton = BrandButton.makeGreenButton()

    override func viewDidLayoutSubviews() {
        primary.configure(viewModel: .init(
            title: text,
            style: .primary,
            leadingIcon: bellIcon,
            trailingIcon: nil,
            isEnabled: true,
            tapAction: { [weak self] in
                print("\(self?.primary.frame.height)")
            }
        ))
        secondary.configure(viewModel: .init(
            title: text,
            style: .secondary,
            leadingIcon: nil,
            trailingIcon: starIcon,
            isEnabled: true,
            tapAction: tapAction
        ))
        disabled.configure(viewModel: .init(
            title: text,
            style: .primary,
            leadingIcon: bellIcon,
            trailingIcon: starIcon,
            isEnabled: false
        ))

        let style = CustomButtonStyle(
            normalTitleColor: .red,
            highlightedTitleColor: .blue,
            disabledTitleColor: .purple,
            normalBackgroundColor: .gray,
            highlightedBackgroundColor: .green,
            disabledBackgroundColor: .orange
        )
        custom.configure(viewModel: .init(
            title: text,
            style: .custom(configure: style),
            leadingIcon: starIcon
        ))
    }

    override func loadView() {
        let view = UIView()

        [primary, secondary, disabled, custom].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        NSLayoutConstraint.activate([
            primary.topAnchor.constraint(equalTo: view.topAnchor),
            primary.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            secondary.topAnchor.constraint(
                equalTo: primary.bottomAnchor,
                constant: defaultInset
            ),
            secondary.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            disabled.topAnchor.constraint(
                equalTo: secondary.bottomAnchor,
                constant: defaultInset
            ),
            disabled.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            custom.topAnchor.constraint(
                equalTo: disabled.bottomAnchor,
                constant: defaultInset * 4
            ),
            custom.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        self.view = view
    }
}

PlaygroundPage.current.liveView = MyViewController()
