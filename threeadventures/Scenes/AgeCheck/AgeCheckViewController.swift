import UIKit
import SnapKit

protocol AgeCheckDisplaying: AnyObject {
    func displaySomething()
}

private extension AgeCheckViewController.Layout {
    // example
    enum Size {
        static let titleSize: CGFloat = 22
        static let descriptionSize: CGFloat = 15
        static let buttonFontSize: CGFloat = 18
        static let defaultAlpha: CGFloat = 0.8
    }
}

final class AgeCheckViewController: ViewController<AgeCheckInteracting, UIView> {
    fileprivate enum Layout {
        // template
    }

    private lazy var contentView = UIView()

    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Assets.AgeCheck.ageCheck.image
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var shadowBoxView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(Layout.Size.defaultAlpha)
        return view
    }()

    private lazy var elementsView: UIView = {
        return UIView()
    }()

    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Assets.logo.image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Você tem mais de 18 anos?"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.marcellusFont(size: Layout.Size.titleSize)
        label.numberOfLines = 0
        return label
    }()

    private lazy var labelDescription: UILabel = {
        let label = UILabel()
        label.text = "Essa é uma história de fantasia e contém elementos +18"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.marcellusFont(size: Layout.Size.descriptionSize)
        label.textAlignment = .center
        return label
    }()

    private lazy var buttonConfirm: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 0.03, green: 0.03, blue: 0.03, alpha: Layout.Size.defaultAlpha)
        button.setTitle("Tenho mais de 18 anos", for: .normal)
        button.titleLabel?.font = UIFont.marcellusFont(size: Layout.Size.buttonFontSize)
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(didTouchConfirm), for: .touchDown)
        button.layer.borderWidth = 1
        return button
    }()

    private lazy var buttonCancel: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 0.03, green: 0.03, blue: 0.03, alpha: Layout.Size.defaultAlpha)
        button.setTitle("Me tire daqui!", for: .normal)
        button.titleLabel?.font = UIFont.marcellusFont(size: Layout.Size.buttonFontSize)
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(didTouchTakeMeOut), for: .touchDown)
        button.layer.borderWidth = 1
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func buildViewHierarchy() {
        contentView.addSubviews(backgroundImage,
                                shadowBoxView)
        elementsView.addSubviews(labelTitle,
                                 labelDescription,
                                 buttonConfirm,
                                 buttonCancel)
        shadowBoxView.addSubviews(logoImage,
                                  elementsView)
        view.addSubview(contentView)
    }

    override func setupConstraints() {
        contentView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }

        backgroundImage.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }

        shadowBoxView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(50)
            $0.bottom.equalToSuperview().inset(50)
            $0.trailing.leading.equalToSuperview().inset(16)
        }

        elementsView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(20)
        }

        labelTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().inset(5)
        }

        labelDescription.snp.makeConstraints {
            $0.top.equalTo(labelTitle.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().inset(5)
        }

        buttonConfirm.snp.makeConstraints {
            $0.top.equalTo(labelDescription.snp.bottom).offset(30)
            $0.trailing.leading.equalToSuperview().offset(5)
        }

        buttonCancel.snp.makeConstraints {
            $0.top.equalTo(buttonConfirm.snp.bottom).offset(15)
            $0.trailing.leading.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview().offset(5)
        }

        logoImage.snp.makeConstraints {
            $0.bottom.equalTo(elementsView.snp.top).inset(-30)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(80)
        }

    }

    override func configureViews() {
        contentView.backgroundColor = .red

        shadowBoxView.layer.cornerRadius = 10
        shadowBoxView.clipsToBounds = true
    }
}

// MARK: - AgeCheckDisplaying
extension AgeCheckViewController: AgeCheckDisplaying {
    func displaySomething() {
        // template
    }
}

@objc
extension AgeCheckViewController {
    func didTouchTakeMeOut() {
        if let url = URL(string: "https://www.youtube.com/watch?v=hpOyXuKfz70") {
            UIApplication.shared.open(url)
        }
    }

    func didTouchConfirm() {
        interactor.setUserOverEighteen()
    }
}
