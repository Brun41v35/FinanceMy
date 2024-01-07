import UIKit

final class HomeViewController: UIViewController {

    // MARK: - LifeCycle

    override func loadView() {
        view = HomeView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Private Methods

    private func setup() {
        setupNavigationTitle()
        setupNavigationRightBatButton()
    }

    private func setupNavigationTitle() {
        title = "Payment List"
    }

    private func setupNavigationRightBatButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(didTapAddPaymentButton))
    }

    @objc
    private func didTapAddPaymentButton() {
        print("Button pressed")
    }
}
