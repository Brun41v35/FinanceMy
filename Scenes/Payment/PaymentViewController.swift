import UIKit

final class PaymentView: UIView {

    // MARK: - Private Properties

    private lazy var paymentNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Pagamento"
        return textField
    }()

    private lazy var paymentValueTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Valor"
        return textField
    }()
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
