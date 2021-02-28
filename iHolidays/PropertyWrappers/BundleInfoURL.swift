//
//  BundleInfoURL.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 6/2/21.
//

import Foundation

@propertyWrapper
struct BundleInfoURL {
    let key: String
    let defaultValue: URL?
    private var bundle: Bundle = .main

    init(key: String, defaultValue: URL? = nil) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: URL {
        let string = (infoDictionary[key] as? String) ?? ""
        guard let url = URL(string: string) ?? defaultValue else {
            fatalError()
        }
        return url
    }

    private var infoDictionary: [String: Any] {
        bundle.infoDictionary ?? [:]
    }
}
