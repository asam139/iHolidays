//
//  Injected.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import Foundation
import Swinject

@propertyWrapper
struct Injected<Value> {

    init(resolver: Resolver = Assembler.shared.resolver) {
        self.wrappedValue = resolver.resolve(Value.self)!
    }

    var wrappedValue: Value
}
