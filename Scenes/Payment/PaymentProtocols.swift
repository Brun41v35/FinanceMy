import UIKit

protocol PaymentViewType where Self: UIView {
    var didTapAddPayment: ((PaymentViewModel) -> Void)? { get set }
}
