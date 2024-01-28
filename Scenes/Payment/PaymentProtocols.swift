import UIKit

protocol PaymentViewType where Self: UIView {
    var didTapAddPayment: ((PaymentViewModel) -> Void)? { get set }
}

protocol PaymentViewControllerDelegate: AnyObject {
    func addNewPayment(cell: PaymentViewModel)
}
