import UIKit

final class HomeViewController: UIViewController {

    // MARK: - Private Properties

    private let contentView: HomeViewType

    // MARK: - Init

    init(contentView: HomeViewType = HomeView()) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Private Methods

    private func setup() {
        setupNavigationTitle()
        setupTableView()
    }

    private func setupTableView() {
        contentView.show(dataSource: self,
                         delegate: self)
    }

    private func setupNavigationTitle() {
        title = "Payment List"
    }


    @objc
    private func didTapAddPaymentButton() {
        let controller = PaymentViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeViewCell else { return UITableViewCell() }
        return cell
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {}
