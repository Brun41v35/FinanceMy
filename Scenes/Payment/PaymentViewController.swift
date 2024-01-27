import UIKit

final class PaymentViewController: UIViewController {

    // MARK: - Internal Properties

    weak var delegate: PaymentViewControllerDelegate?

    // MARK: - Private Properties

    private let contentView: PaymentViewType

    // MARK: Init

    init(contentView: PaymentViewType = PaymentView()) {
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
        title = "Pagamento"
        bindLayoutEvents()
    }

    private func bindLayoutEvents() {
        contentView.didTapAddPayment = { [weak self] cell in
            self?.dismiss(animated: true)
            self?.delegate?.addNewPayment(cell: cell)
        }
        
        contentView.didTapCloseButton = { [weak self] in
            self?.dismiss(animated: true)
        }
    }
}
