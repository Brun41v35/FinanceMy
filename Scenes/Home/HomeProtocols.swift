import UIKit

protocol HomeViewType where Self: UIView {
    var didTapAddPayment: (() -> Void)? { get set }

    func show(dataSource: UITableViewDataSource,
              delegate: UITableViewDelegate)
}

protocol HomeViewCellType {
    func show(viewModel: PaymentViewModel)
}
