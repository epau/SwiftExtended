public extension Sequence {

    /// Returns a Boolean value indicating whether all elements in the sequence the same  values for all passed in key paths.
    ///
    /// This example tests whether one countable range shares the same elements
    /// as another countable range and an array.
    ///
    ///     struct Mock {
    ///         let x: Int
    ///         let y: Int
    ///     }
    ///     let a = Mock(a: 0, b: 0)
    ///     let b = Mock(a: 0, b: 0)
    ///     let c = Mock(a: 1, b: 0)
    ///
    ///     print([a, b].haveEqualValues(for: [\Mock.x, \Mock.y])
    ///     // Prints "true"
    ///     print([a, b, c].haveEqualValues(for: [\Mock.x, \Mock.y])
    ///     // Prints "false"
    ///
    /// - Parameter keyPaths: The key paths to test equality.
    /// - Returns: `true` if all elements in this sequence have equal values for all `keyPaths`.
    ///
    /// - Complexity: O(*m* *n*), where *m* is the  of the length of the sequence and *n* is the number of key paths.
    @inlinable func haveEqualValues<T: Equatable>(for keyPaths: [KeyPath<Element, T>]) -> Bool {
        var iter = makeIterator()
        guard let truth = iter.next() else { return true }
        let truthValues = keyPaths.map { truth[keyPath: $0] }
        while let element = iter.next() {
            let values = keyPaths.map { element[keyPath: $0] }
            if !values.elementsEqual(truthValues) {
                return false
            }
        }
        return true
    }
}
