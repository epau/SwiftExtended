// MARK: - Box

/// `Box` wraps an object in a class
final class Box<T> {
    var value: T
    init(_ value: T) {
        self.value = value
    }
}

// MARK: - Weak Box

/// `WeakBox` wraps an object in a class while only maintaing weak ownership over the object.
final class WeakBox<T: AnyObject> {
    weak var value: T?
    init(_ value: T) {
        self.value = value
    }
}
