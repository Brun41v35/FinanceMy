import UIKit

final class PaymentView: UIView {

    // MARK: - Private Properties

    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var paymentNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Pagamento"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.textColor = .label
        textField.tintColor = .label
        textField.font = UIFont.preferredFont(forTextStyle: .title2)
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 12
        textField.backgroundColor = .systemBackground
        textField.returnKeyType = .next
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var paymentValueTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Valor"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.textColor = .label
        textField.tintColor = .label
        textField.font = UIFont.preferredFont(forTextStyle: .title2)
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 12
        textField.backgroundColor = .systemBackground
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var addPaymentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Confirmar", for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setup() {
        setupViewHierarchy()
        setupConstraints()
        setupBackgroundColor()
    }

    private func setupViewHierarchy() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(paymentNameTextField)
        mainStackView.addArrangedSubview(paymentValueTextField)
        mainStackView.addArrangedSubview(addPaymentButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])

        NSLayoutConstraint.activate([
            paymentNameTextField.heightAnchor.constraint(equalToConstant: 50),
            paymentValueTextField.heightAnchor.constraint(equalToConstant: 50),
            addPaymentButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func setupBackgroundColor() {
        backgroundColor = .systemBackground
    }
}

final class PaymentViewController: UIViewController {

    // MARK: - LifeCycle

    override func loadView() {
        view = PaymentView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pagamento"
    }
}
