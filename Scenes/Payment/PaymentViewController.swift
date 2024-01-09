import UIKit

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
