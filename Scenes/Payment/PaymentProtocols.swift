import UIKit

protocol PaymentViewType where Self: UIView {
    var didTapAddPayment: (() -> Void)? { get set }
}
