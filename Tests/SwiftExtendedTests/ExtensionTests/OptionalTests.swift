import XCTest
@testable import SwiftExtended

final class OptionalTests: XCTestCase {

    // MARK: - Clamping Tests

    func testNilOrForNonNil() {
        let a: String? = "Hello"
        let expectedResult = "Hello World"

        let result = a.nilOr { $0 + " World" }

        XCTAssertEqual(result, expectedResult, "nilOr should perform the passed in closure when the optional is not nil")
    }
    
    func testNilOrForNil() {
        let a: String? = nil

        let result = a.nilOr { $0 + " World" }

        XCTAssertNil(result, "nilOr should return nil when the optional is nil")
    }

    // MARK: - All Tests

    static var allTests = [
        ("testNilOrForNonNil", testNilOrForNonNil),
        ("testNilOrForNil", testNilOrForNil)
    ]
}

