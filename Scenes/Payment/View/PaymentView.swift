import UIKit

final class PaymentView: UIView, PaymentViewType {

    // MARK: - Internal Properties

    var didTapAddPayment: ((PaymentViewModel) -> Void)?
    var didTapCloseButton: (() -> Void)?

    // MARK: - Private Properties

    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = .systemGray5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var paymentNameTextField: FYTextField = {
        let textField = FYTextField()
        textField.placeholder = "Pagamento"
        textField.returnKeyType = .next
        return textField
    }()

    private lazy var paymentValueTextField: FYTextField = {
        let textField = FYTextField()
        textField.placeholder = "Valor"
        textField.keyboardType = .numberPad
        textField.returnKeyType = .done
        return textField
    }()

    private lazy var addPaymentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Confirmar", for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "xmark")
        button.setImage(image, for: .normal)
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
        bindLayoutEvents()
    }

    private func setupViewHierarchy() {
        addSubview(closeButton)
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(paymentNameTextField)
        mainStackView.addArrangedSubview(paymentValueTextField)
        mainStackView.addArrangedSubview(addPaymentButton)
    }

    private func setupConstraints() {

        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
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

    private func bindLayoutEvents() {
        addPaymentButton.addTarget(self, action: #selector(addNewPayment), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
    }
    
    @objc
    private func addNewPayment() {
        let model = PaymentViewModel(name: paymentNameTextField.text ?? "",
                                     value: paymentValueTextField.text ?? "")
        didTapAddPayment?(model)
    }

    @objc
    private func didTapClose() {
        didTapCloseButton?()
    }
}
