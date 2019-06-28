import XCTest
@testable import SwiftExtended

final class ComparableTests: XCTestCase {

    // MARK: - Clamping Tests

    func testClamp() {
        var value = -1
        let range = (0...10)

        value.clamp(to: range)

        XCTAssertEqual(value, range.lowerBound,
                       "clamp() didn't mutate the caller within to be within the bounds: \(value)")
    }

    func testClamped() {
        let value = 3
        let range = (0...10)

        let result = value.clamped(to: range)

        XCTAssertEqual(result, value,
                       "clamped() didn't return the correct value: \(result)")
    }

    func testClampedToLowerBound() {
        let value = -1
        let range = (0...10)

        let result = value.clamped(to: range)

        XCTAssertEqual(result, range.lowerBound,
                       "clamped() didn't return a value within the bounds: \(result)")
    }

    func testClampedToUpperBound() {
        let value = 11
        let range = (0...10)

        let result = value.clamped(to: range)

        XCTAssertEqual(result, range.upperBound,
                       "clamped() didn't return a value within the bounds: \(result)")
    }

    // MARK: - All Tests

    static var allTests = [
        ("testClamp", testClamp),
        ("testClamped", testClamped),
        ("testClampedToLowerBound", testClampedToLowerBound),
        ("testClampedToUpperBound", testClampedToUpperBound)
    ]
}
