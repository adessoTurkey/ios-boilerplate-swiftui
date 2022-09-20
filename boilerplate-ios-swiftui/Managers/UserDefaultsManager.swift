import Foundation

protocol UserDefaultsManagerProtocol: AnyObject {

    func resetUserDefaults()

    var boolExample: Bool { get set }
    var stringExample: String? { get set }
    var intExample: Int { get set }
    var dateExample: Date? { get set }
}

final class UserDefaultsManager: UserDefaultsManagerProtocol {

    private enum Key {
        static let stringExample = "stringExample"
        static let boolExample = "boolExample"
        static let intExample = "intExample"
        static let dateExample = "objectExample"
    }

    private let userDefaults: UserDefaults

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }

    func resetUserDefaults() {
        let keysToRemove: [String] = [
            Key.boolExample,
            Key.stringExample,
            Key.intExample,
            Key.dateExample
        ]

        for key in keysToRemove {
            userDefaults.removeObject(forKey: key)
        }
    }

    var boolExample: Bool {
        get {
            userDefaults.bool(forKey: Key.boolExample)
        }
        set {
            userDefaults.set(newValue, forKey: Key.boolExample)
        }
    }

    var stringExample: String? {
        get {
            userDefaults.string(forKey: Key.stringExample)
        }
        set {
            userDefaults.setValue(newValue, forKey: Key.stringExample)
        }
    }

    var intExample: Int {
        get {
            userDefaults.integer(forKey: Key.intExample)
        }
        set {
            userDefaults.setValue(newValue, forKey: Key.intExample)
        }
    }

    var dateExample: Date? {
        get {
            userDefaults.object(forKey: Key.dateExample) as? Date
        }
        set {
            userDefaults.setValue(newValue, forKey: Key.dateExample)
        }
    }
}
