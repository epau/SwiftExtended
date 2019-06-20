public extension Collection {
    // MARK: - Subscripting

    /// Accesses the element at the specified position.
    ///
    /// The following example accesses an element of an array through its subscript to print its value and returns nil if the index is invalid:
    ///
    ///     var streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
    ///     print(streets[1])
    ///     // Prints "Bryant"
    ///     print(streets[10])
    ///     // Prints "nil"
    ///
    /// - Parameter position: The position of the element to access.
    /// - Returns: The element at the given `position` or nil if the `position` is an invalid index.
    ///
    /// - Complexity: O(1)
    subscript(safe position: Index) -> Element? {
        guard position >= startIndex && position < endIndex else { return nil }
        return self[position]
    }
}

public extension Collection where Element: Hashable {
    // MARK: - Uniques

    /// The unique elements of this collection maintaining their order.
    ///
    /// The following example accesses the unique elements of the collection
    ///
    ///     let streets = ["Adams", "Bryant", "Adams", "Channing", "Douglas", "Channing", "Evarts"]
    ///     print(streets.uniques)
    ///     // Prints "Adams, Bryant, Channing, Douglas, Evarts"
    ///
    /// - Complexity: O(*m*) where *m* is the length of the collection
    var uniques: [Element] {
        var dict: [Element: Bool] = [:]
        return filter { dict.updateValue(true, forKey: $0) == nil }
    }
}

extension Collection where Element: Collection, Element.Index == Int {
    // MARK: - Zip
    
    /// Creates a collection of collections where the elements are grouped by their position in their original
    /// collections.
    ///
    /// In the collection instance returned by this function, the elements of the ith collection are the ith elements of
    /// each of the underlying collections. The following example uses the zipped() function to group elements by their
    /// number.
    ///
    ///     let a = ["A1", "A2", "A3", "A4"]
    ///     let b = ["B1"]
    ///     let c = ["C1", "C2", "C3"]
    ///
    ///     let abcs = [a, b, c].zipped()
    ///     print(abcs)
    ///     // Prints [["A1", "B1", "C1"], ["A2", "C2"], ["A3", "C3"], ["A4"]]
    ///
    /// - Returns: A collection of collections where the elements of the ith collection are the ith elements of each of
    ///   the underlying collections.
    func zipped() -> [[Element.Element]] {
        let n = map { $0.count }.max() ?? 0
        return (0..<n).map { i in
            compactMap { collection in
                i < collection.count ? collection[i] : nil
            }
        }
    }
}
