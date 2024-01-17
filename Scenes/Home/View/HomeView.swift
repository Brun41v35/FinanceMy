import UIKit

final class HomeView: UIView {

    // MARK: - Private Properties

    private let topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let value: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.adjustsFontForContentSizeCategory = true
        label.text = "TestTest"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        setupBackgroundColor()
    }

    private func setupViewHierarchy() {
        addSubview(topStackView)
        topStackView.addArrangedSubview(value)
        addSubview(tableView)
    }

    private func setupConstraints() {

        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            topStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            topStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo:  topStackView.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }

    private func setupBackgroundColor() {
        backgroundColor = .systemBackground
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
