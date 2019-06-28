import XCTest
@testable import SwiftExtended

final class BoxTests: XCTestCase {

    // MARK: - Clamping Tests

    func testWeakBox() {
        var box: Box? = Box("👋")
        let weakBox = WeakBox(box!)

        XCTAssertTrue(weakBox.value === box && weakBox.value != nil,
                      "WeakBox's value isn't the expected value: \(String(describing: weakBox.value))")

        box = nil

        XCTAssertNil(weakBox.value,
                     "WeakBox didn't release it's weak reference")
    }

    // MARK: - All Tests

    static var allTests = [
        ("testWeakBox", testWeakBox)
    ]
}
