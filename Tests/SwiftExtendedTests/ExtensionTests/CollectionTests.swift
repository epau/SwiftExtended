import XCTest
@testable import SwiftExtended

final class CollectionTests: XCTestCase {

    // MARK: - Safe Subscripting Tests

    func testSafeSubscript() {
        let collection = Array((0...10))
        let index = 4

        let result = collection[safe: index]

        XCTAssertNotNil(result,
                        "Safe subscripting returned nil")
    }

    func testSafeSubscriptWithIndexGreaterThanCount() {
        let collection = Array((0...10))
        let index = 12

        let result = collection[safe: index]

        XCTAssertNil(result,
                     "Safe subscripting didn't return nil: \(result!)")
    }

    func testSafeSubscriptWithNegativeIndex() {
        let collection = Array((0...10))
        let index = -2

        let result = collection[safe: index]

        XCTAssertNil(result,
                     "Safe subscripting didn't return nil: \(result!)")
    }

    // MARK: - Uniques Tests

    func testUniques() {
        let collection = [1, 2, 1, 3, 4, 2, 4, 4, 5, 5, 6]
        let uniques = collection.uniques()
        let expected = [1, 2, 3, 4, 5, 6]

        let result = uniques.elementsEqual(expected)

        XCTAssertTrue(result,
                      "unqiues() returned duplicate elements or elements out of order: \(result)")
    }

    // MARK: - Zip Tests

    func testZip() {
        let a = (1...3).map { "A\($0)" }
        let b = (1...2).map { "B\($0)" }
        let c = (1...4).map { "C\($0)" }
        let expected = [
            ["A1", "B1", "C1"],
            ["A2", "B2", "C2"],
            ["A3", "C3"],
            ["C4"]
        ]

        let result = [a, b, c].zipped()

        XCTAssertEqual(result, expected,
                       "zipped() didn't zip it's elements properly: \(result)")
    }

    // MARK: - All Tests

    static var allTests = [
        ("testSafeSubscript", testSafeSubscript),
        ("testSafeSubscriptWithIndexGreaterThanCount", testSafeSubscriptWithIndexGreaterThanCount),
        ("testSafeSubscriptWithNegativeIndex", testSafeSubscriptWithNegativeIndex),
        ("testUniques", testUniques),
        ("testZip", testZip)
    ]
}
