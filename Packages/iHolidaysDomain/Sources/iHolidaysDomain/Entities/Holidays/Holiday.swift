//
//  Holiday.swift
//
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import Foundation

public struct Holiday: Equatable {
    public let id: String
    public let name: String
    public let date: Date
    public let observedDate: Date
    public let isPublic: Bool
    public let countryCode: String

    public init(
        id: String,
        name: String,
        date: Date,
        observedDate: Date,
        isPublic: Bool,
        countryCode: String
    ) {
        self.id = id
        self.name = name
        self.date = date
        self.observedDate = observedDate
        self.isPublic = isPublic
        self.countryCode = countryCode
    }
}
