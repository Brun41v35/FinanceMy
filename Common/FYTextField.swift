import UIKit

final class FYTextField: UITextField {

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setup() {
        textAlignment = .center
        layer.cornerRadius = 8
        textColor = .label
        tintColor = .label
        font = UIFont.systemFont(ofSize: 20)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 5
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
    }
}
