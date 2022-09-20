//
//  StringExtensions.swift
//  boilerplate-ios-swiftui
//
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import UIKit

extension String {

    static var empty: Self {
        ""
    }

    var localized: String {
        // swiftlint:disable: nslocalizedstring_key
        NSLocalizedString(self, comment: "")
    }

    func localized(withComment comment: String,
                   tableName: String? = nil,
                   bundle: Bundle = Bundle.main,
                   value: String = "") -> String {
        NSLocalizedString(self, tableName: tableName, bundle: bundle, value: value, comment: comment)
    }

    func localized(withDefaultValue value: String,
                   tableName: String? = nil,
                   bundle: Bundle = Bundle.main,
                   comment: String = "") -> String {
        NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: value, comment: comment)
    }

    func isValidEmail() -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSRange(location: 0, length: count)) != nil
        } catch {
            return false
        }
    }

    /// > Warning: Non-ASCII characters not allowed default.
    ///
    /// - Returns: True if all characters alphanumeric
    func isAlphanumeric(turkishCharactersAllowed: Bool = false) -> Bool {
        let regex = turkishCharactersAllowed ? "[^a-zA-Z0-9çÇğĞıİöÖşŞüÜ]" : "[^a-zA-Z0-9]"
        return !isEmpty && range(of: regex, options: .regularExpression) != nil
    }

    func isValidPassword(minCharCount: Int,
                         maxCharCount: Int,
                         rule: PasswordRule,
                         turkishCharacterAllowed: Bool = false) -> Bool {

        let firstCondition = self.count >= minCharCount && self.count <= maxCharCount

        switch rule {
            case .anything:
                return firstCondition
            case .number:
                return firstCondition && isOnlyNumbers()
            case .letter:
                return firstCondition && isOnlyLetters(turkishCharactersAllowed: turkishCharacterAllowed)
            case .numberAndLetter:
                return firstCondition && hasNumbersAndLetters(turkishCharactersAllowed: turkishCharacterAllowed)
            case .upperLowerCased:
                return firstCondition && !hasNumbers() && hasUpperAndLowerCase(turkishCharactersAllowed: turkishCharacterAllowed)
            case .numberAndULCased:
                return firstCondition && hasNumbersAndLetters(turkishCharactersAllowed: turkishCharacterAllowed)
            case .highSecure:
                return firstCondition && isHighSecurePassword(turkishCharactersAllowed: turkishCharacterAllowed)
        }
    }

    func isOnlyNumbers() -> Bool {
        self.range(of: "^[0-9]+$", options: .regularExpression) != nil
    }

    /// > Warning: Non-ASCII characters not allowed default.
    ///
    /// - Returns: True if all characters are letters
    fileprivate func isOnlyLetters(turkishCharactersAllowed: Bool = false) -> Bool {
        let regex = turkishCharactersAllowed ? "^[a-zA-ZçÇğĞıİöÖşŞüÜ]+$" : "^[a-zA-Z]+$"
        return !isEmpty && (range(of: regex, options: .regularExpression) != nil)
    }

    /// > Warning: Non-ASCII characters not allowed default.
    ///
    /// - Returns: True if at least one lower cased and one upper cased character included without any other character
    fileprivate func hasUpperAndLowerCase(turkishCharactersAllowed: Bool = false) -> Bool {
        let regex = turkishCharactersAllowed ? "^(?=.*[A-ZÇĞİÖŞÜ])(?=.*[a-z]zçğıöşü)" : "^(?=.*[A-Z])(?=.*[a-z])"
        return !isEmpty && range(of: regex, options: .regularExpression) != nil
    }

    fileprivate func hasNumbers() -> Bool {
        let regex = "^(?=.*[0-9])"
        return !isEmpty && range(of: regex, options: .regularExpression) != nil
    }

    /// > Warning: Non-ASCII characters not allowed default.
    ///
    /// - Returns: True if at least one lower cased and one upper cased and one number character included without any other character
    fileprivate func hasNumberUpperAndLowerCase(turkishCharactersAllowed: Bool = false) -> Bool {
        let regex = turkishCharactersAllowed ? "^[0-9][a-zçğıöşü][A-ZÇĞİÖŞÜ]+$" : "^[0-9][a-z][A-Z]+$"
        return !isEmpty && range(of: regex, options: .regularExpression) != nil
    }

    /// > Warning: Non-ASCII characters not allowed default.
    /// > Warning: Letter can be uppercased or lowercased. It doesn't matter
    ///
    /// - Returns: True if at least one lower cased and one upper cased character included without any other character
    fileprivate func hasNumbersAndLetters(turkishCharactersAllowed: Bool = false) -> Bool {
        let regex = turkishCharactersAllowed ? "[^a-zA-Z0-9çÇğĞıİöÖşŞüÜ]" : "[^a-zA-Z0-9]"
        return !isEmpty && range(of: regex, options: .regularExpression) != nil
    }

    /// > Warning: Non-ASCII characters not allowed default.
    /// > Warning: Doesn't check string length!
    ///
    /// - Returns: True if at least one lower cased and one upper cased character and one special character
    fileprivate func isHighSecurePassword(turkishCharactersAllowed: Bool = false) -> Bool {
        let regex = turkishCharactersAllowed ?
        "^[a-zçğıöşü][A-ZÇĞİÖŞÜ][0-9][!@#$&*]$" :
        "^[a-z][A-Z][0-9][!@#$&*]$"
        return !isEmpty && range(of: regex, options: .regularExpression) != nil
    }
}
/// Password Rule Enum
enum PasswordRule {
    /// Literally anything is fine
    case anything
    /// Only numbers
    case number
    /// Only letters
    case letter
    /// At least one number and one letter. Case insensitive. Special character is not allowed
    case numberAndLetter
    /// At least one upper cased one lower cased letter
    case upperLowerCased
    /// At least one upper cased letter, one lower cased letter, and one number
    case numberAndULCased
    /// At least one upper cased letter, one lower cased letter, one number, and one special character
    case highSecure
}
