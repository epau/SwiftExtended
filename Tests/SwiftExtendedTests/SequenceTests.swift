import XCTest
@testable import SwiftExtended

final class SequenceTests: XCTestCase {

    // MARK: - haveEqualValues(for keypaths:_) Tests

    func testHaveEqualValuesTrue() {
        struct Mock {
            let a: Int
            let b: Int
        }

        let a = Mock(a: 1, b: 1)
        let b = Mock(a: 1, b: 1)

        let result = [a, b].haveEqualValues( for:[\Mock.a,
                                                  \Mock.b])

        XCTAssertTrue(result, "haveEqualValues should be True")
    }

    func testHaveEqualValuesFalse() {
        struct Mock {
            let a: Int
            let b: Int
        }

        let a = Mock(a: 1, b: 1)
        let b = Mock(a: 0, b: 0)

        let result = [a, b].haveEqualValues( for:[\Mock.a,
                                                  \Mock.b])

        XCTAssertFalse(result, "haveEqualValues should be False")
    }

    func testHaveEqualValuesWithEmptySequence() {
        struct Mock {
            let a: Int
            let b: Int
        }

        let result = [].haveEqualValues( for:[\Mock.a,
                                              \Mock.b])

        XCTAssertTrue(result, "haveEqualValues should be True when the sequence is empty")
    }

    func testHaveEqualValuesWithEmptyKeyPaths() {
        struct Mock {
            let a: Int
            let b: Int
        }

        let a = Mock(a: 1, b: 1)
        let b = Mock(a: 0, b: 0)
        let keyPaths: [KeyPath<Mock, Int>] = []

        let result = [a, b].haveEqualValues( for: keyPaths)

        XCTAssertTrue(result, "haveEqualValues should be True when there are no key paths")
    }

    func testHaveEqualValuesWithASingleElement() {
        struct Mock {
            let a: Int
            let b: Int
        }

        let a = Mock(a: 1, b: 1)

        let result = [a].haveEqualValues( for:[\Mock.a,
                                              \Mock.b])

        XCTAssertTrue(result, "haveEqualValues should be True for a single element")
    }

    // MARK: - All Tests

    static var allTests = [
        ("testHaveEqualValuesTrue", testHaveEqualValuesTrue),
        ("testHaveEqualValuesFalse", testHaveEqualValuesFalse),
        ("testHaveEqualValuesWithEmptySequence", testHaveEqualValuesWithEmptySequence),
        ("testHaveEqualValuesWithEmptyKeyPaths", testHaveEqualValuesWithEmptyKeyPaths),
        ("testHaveEqualValuesWithASingleElement", testHaveEqualValuesWithASingleElement)
    ]
}
