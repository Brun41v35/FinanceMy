import UIKit

protocol HomeViewType where Self: UIView {
    func show(dataSource: UITableViewDataSource,
              delegate: UITableViewDelegate)
}

protocol HomeViewCellType {
    func show(viewModel: PaymentViewModel)
}
