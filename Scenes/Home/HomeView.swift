import UIKit

final class HomeView: UIView {

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
        setupConstraints()
        setupBackgroundColor()
    }

    private func setupConstraints() {}

    private func setupBackgroundColor() {
        backgroundColor = .systemBackground
    }
}
