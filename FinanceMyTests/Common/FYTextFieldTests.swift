import UIKit
import XCTest
@testable import FinanceMy

final class FYTextFieldTests: XCTestCase {

    func test_setup_informationsTextField() {
        let sut = FYTextField()
        let font = UIFont.systemFont(ofSize: 20)

        XCTAssertEqual(sut.textAlignment, .center)
        XCTAssertEqual(sut.layer.cornerRadius, 8)
        XCTAssertEqual(sut.textColor, .label)
        XCTAssertEqual(sut.tintColor, .label)
        XCTAssertEqual(sut.font, font)
        XCTAssertEqual(sut.adjustsFontSizeToFitWidth, true)
        XCTAssertEqual(sut.minimumFontSize, 5)
        XCTAssertEqual(sut.backgroundColor, .systemBackground)
        XCTAssertEqual(sut.translatesAutoresizingMaskIntoConstraints, false)
    }
}
