import UIKit

protocol HomeViewType where Self: UIView {
    func show(dataSource: UITableViewDataSource,
              delegate: UITableViewDelegate)
}
