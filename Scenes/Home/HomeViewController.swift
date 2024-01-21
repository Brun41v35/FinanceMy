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
        bindLayoutEvents()
    }

    private func setupTableView() {
        contentView.show(dataSource: self,
                         delegate: self)
    }

    private func setupNavigationTitle() {
        title = "Payment List"
    }

    private func bindLayoutEvents() {
        contentView.didTapAddPayment = { [weak self] in
            let controller = PaymentViewController()
            controller.delegate = self
            self?.navigationController?.present(controller, animated: true)
        }
    }
}

// MARK: - PaymentViewControllerDelegate

extension HomeViewController: PaymentViewControllerDelegate {

    func addNewPayment(model: PaymentViewModel) {
        <#code#>
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
