extension Optional {
    // MARK: - nilor

    /// Unwraps the optional and runs the provided closure with it if it is not nil, otherwise returns nil.
    ///
    /// The following example tries to append " World" to the provided optional string.
    ///
    ///     let a: String? = "Hello"
    ///     let b: String? = nil
    ///
    ///     let resultA = a.nilOr { $0 + " World" }
    ///     print(resultA)
    ///     // Prints "Hello World"
    ///
    ///     let resultB = b.nilOr { $0 + " World" }
    ///     print(resultB)
    ///     // Prints nil
    ///
    /// - Parameter f: The closure to execute with Self.
    /// - Returns: The result of the closure. Returns nil if the optional is nil.
    func nilOr<T>(_ f: (Wrapped) -> T?) -> T? {
        switch self {
        case .some(let val):
            return f(val)
        case _:
            return nil
        }
    }
}
