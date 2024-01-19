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
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let leadingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 16
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let trailingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let iconImageView: UIImageView = {
        let image = UIImage(systemName: "bag.circle.fill")?.withTintColor(.systemBackground, renderingMode: .alwaysOriginal)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titlePaymentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let valuePaymentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .right
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
        horizontalStackView.addArrangedSubview(leadingStackView)
        horizontalStackView.addArrangedSubview(trailingStackView)
        leadingStackView.addArrangedSubview(iconImageView)
        leadingStackView.addArrangedSubview(titlePaymentLabel)
        trailingStackView.addArrangedSubview(valuePaymentLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])

        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            horizontalStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            horizontalStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            horizontalStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])

        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalToConstant: 50),
            iconImageView.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: - HomeViewCellType

extension HomeViewCell: HomeViewCellType {

    func show(viewModel: PaymentViewModel) {
        titlePaymentLabel.text = viewModel.name
        valuePaymentLabel.text = viewModel.value
    }
}
