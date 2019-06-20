public extension Comparable {
    // MARK: - Clamp
    
    /// Clamps this comparable to the given limiting range.
    ///
    /// The result is always limited to the bounds of `limits`.
    /// For example:
    ///
    ///     var value = -1
    ///     print(value.clamp(to: 0...10))
    ///     // Prints "0"
    ///
    /// - Parameter limits: The range to clamp this comparable.
    mutating func clamp(to limits: ClosedRange<Self>) {
        if self < limits.lowerBound {
            self = limits.lowerBound
        } else if self > limits.upperBound {
            self = limits.upperBound
        }
    }

    /// Returns a copy of this comparable clamped to the given limiting range.
    ///
    /// - Parameter limits: The range to clamp the comparable.
    /// - Returns: A comparable clamped to the bounds of `limits`.
    func clamped(to limits: ClosedRange<Self>) -> Self {
         var result = self
        result.clamp(to: limits)
        return result
    }
}
