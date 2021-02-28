//
//  BundleInfoString.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 6/2/21.
//

import Foundation

@propertyWrapper
struct BundleInfo<Value> {
    let key: String
    let defaultValue: Value?
    private var bundle: Bundle = .main

    init(key: String, defaultValue: Value? = nil) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: Value {
        guard let value = (infoDictionary[key] as? Value) ?? defaultValue else {
            fatalError()
        }
        return value
    }

    private var infoDictionary: [String: Any] {
        bundle.infoDictionary ?? [:]
    }
}
