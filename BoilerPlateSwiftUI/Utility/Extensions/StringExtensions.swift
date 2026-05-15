//
//  StringExtensions.swift
//  boilerplate-ios-swiftui
//
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import UIKit

extension String {

    var localized: String {
        NSLocalizedString(self, comment: .empty) // swiftlint:disable:this nslocalizedstring_key
    }

    func localized(withComment comment: String, tableName: String? = nil, bundle: Bundle = Bundle.main, value: String = .empty) -> String {
        NSLocalizedString(self, tableName: tableName, bundle: bundle, value: value, comment: comment) // swiftlint:disable:this nslocalizedstring_key
    }

    func localized(withDefaultValue value: String, tableName: String? = nil, bundle: Bundle = Bundle.main, comment: String = .empty) -> String {
        NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: value, comment: comment) // swiftlint:disable:this nslocalizedstring_key
    }

    static var empty: Self {
        ""
    }
}
