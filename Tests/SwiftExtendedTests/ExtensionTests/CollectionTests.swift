import XCTest
@testable import SwiftExtended

final class CollectionTests: XCTestCase {

    // MARK: - Safe Subscripting Tests

    func testSafeSubscript() {
        let collection = Array((0...10))
        let index = 4

        let result = collection[safe: index]

        XCTAssertNotNil(result, "safe subscripting should return a non-nil value for a valid index")
    }

    func testSafeSubscriptWithIndexGreaterThanCount() {
        let collection = Array((0...10))
        let index = 12

        let result = collection[safe: index]

        XCTAssertNil(result, "safe subscripting should return nil value for an invalid index")
    }

    func testSafeSubscriptWithNegativeIndex() {
        let collection = Array((0...10))
        let index = -2

        let result = collection[safe: index]

        XCTAssertNil(result, "safe subscripting should return nil value for an invalid index")
    }

    // MARK: - Uniques Tests

    func testUniques() {
        let collection = [1, 2, 1, 3, 4, 2, 4, 4, 5, 5, 6]
        let uniques = collection.uniques
        let expected = [1, 2, 3, 4, 5, 6]

        let result = uniques.elementsEqual(expected)

        XCTAssertTrue(result, "uniques should return the collection's elements with no duplicates and in the same order")
    }

    // MARK: - All Tests

    static var allTests = [
        ("testSafeSubscript", testSafeSubscript),
        ("testSafeSubscriptWithIndexGreaterThanCount", testSafeSubscriptWithIndexGreaterThanCount),
        ("testSafeSubscriptWithNegativeIndex", testSafeSubscriptWithNegativeIndex),
        ("testUniques", testUniques)
    ]
}
