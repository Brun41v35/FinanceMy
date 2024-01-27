import UIKit

protocol PaymentViewType where Self: UIView {
    var didTapAddPayment: ((PaymentViewModel) -> Void)? { get set }
    var didTapCloseButton: (() -> Void)? { get set }
}

protocol PaymentViewControllerDelegate: AnyObject {
    func addNewPayment(cell: PaymentViewModel)
}
