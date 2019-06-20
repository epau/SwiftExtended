import XCTest
@testable import SwiftExtended

final class ComparableTests: XCTestCase {

    // MARK: - Clamping Tests

    func testClamped() {
        let value = 3
        let range = (0...10)

        let result = value.clamped(to: range) == value

        XCTAssertTrue(result, "clamped should return the caller value when it is within the bounds")
    }

    func testClamp() {
        var value = -1
        let range = (0...10)

        value.clamp(to: range)
        let result = value == range.lowerBound

        XCTAssertTrue(result, "clamp should mutate the value to the lower bound when the value is less than the lower bound")
    }

    func testClampedToLowerBound() {
        let value = -1
        let range = (0...10)

        let result = value.clamped(to: range) == range.lowerBound

        XCTAssertTrue(result, "clamped should return a value the lower bound when the value is less than the lower bound")
    }

    func testClampedToUpperBound() {
        let value = 11
        let range = (0...10)

        let result = value.clamped(to: range) == range.upperBound

        XCTAssertTrue(result, "clamped should return a value the upper bound when the value is greater than the upper bound")
    }

    // MARK: - All Tests

    static var allTests = [
        ("testClamped", testClamped),
        ("testClamp", testClamp),
        ("testClampedToLowerBound", testClampedToLowerBound),
        ("testClampedToUpperBound", testClampedToUpperBound)
    ]
}
