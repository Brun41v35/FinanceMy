import UIKit

final class HomeView: UIView {

    // MARK: - Internal Properties

    var didTapAddPayment: (() -> Void)?

    // MARK: - Private Properties

    private let topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let informationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.text = "Valor total"
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.text = "R$ 250,00"
        label.adjustsFontForContentSizeCategory = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let addPaymentButton: UIButton = {
        let button = UIButton()
        button.setTitle("New Payment", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        bindLayoutEvents()
        setupBackgroundColor()
    }

    private func setupViewHierarchy() {
        addSubview(topStackView)
        topStackView.addArrangedSubview(informationLabel)
        topStackView.addArrangedSubview(valueLabel)
        addSubview(tableView)
        addSubview(addPaymentButton)
    }

    private func setupConstraints() {

        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            topStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            topStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])

        NSLayoutConstraint.activate([
            addPaymentButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            addPaymentButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            addPaymentButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo:  topStackView.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }

    private func bindLayoutEvents() {
        addPaymentButton.addTarget(self,
                                   action: #selector(didTapAddPaymentButton),
                                   for: .touchUpInside)
    }

    private func setupBackgroundColor() {
        backgroundColor = .systemBackground
    }

    @objc
    private func didTapAddPaymentButton() {
        didTapAddPayment?()
    }
}


// MARK: - HomeViewType

extension HomeView: HomeViewType {

    func show(dataSource: UITableViewDataSource,
              delegate: UITableViewDelegate) {
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        tableView.register(HomeViewCell.self, forCellReuseIdentifier: "cell")
    }
}
