import UIKit

final class HomeViewCell: UITableViewCell {

    // MARK: - Private Properties

    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let titlePaymentLabel: UILabel = {
        let label = UILabel()
        label.text = "Gym"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let valuePaymentLabel: UILabel = {
        let label = UILabel()
        label.text = "R$ 250,00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
    }

    private func setupViewHierarchy() {
        addSubview(containerView)
        containerView.addSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(titlePaymentLabel)
        horizontalStackView.addArrangedSubview(valuePaymentLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
//            containerView.heightAnchor.constraint(equalToConstant: 50)
        ])

        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}
