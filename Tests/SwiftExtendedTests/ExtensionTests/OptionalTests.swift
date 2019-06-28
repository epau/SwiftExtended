import XCTest
@testable import SwiftExtended

final class OptionalTests: XCTestCase {

    // MARK: - Clamping Tests

    func testNilOrForNonNil() {
        let a: String? = "Hello"
        let expected = "Hello World"

        let result = a.nilOr { $0 + " World" }

        XCTAssertEqual(result, expected,
                       "nilOr() didn't return the result of the passed in closure: \(result!)")
    }
    
    func testNilOrForNil() {
        let a: String? = nil

        let result = a.nilOr { $0 + " World" }

        XCTAssertNil(result,
                     "nilOr() didn't return nil: \(result!)")
    }

    // MARK: - All Tests

    static var allTests = [
        ("testNilOrForNonNil", testNilOrForNonNil),
        ("testNilOrForNil", testNilOrForNil)
    ]
}
