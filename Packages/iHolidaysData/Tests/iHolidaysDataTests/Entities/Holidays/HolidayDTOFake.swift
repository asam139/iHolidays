//
//  HolidayDTOFake.swift
//  iHolidaysData
//
//  Created by Saúl Moreno Abril on 28/2/21.
//

import iHolidaysData

enum HolidayDTOFake {
    static let id = "0"
    static let name = "name"
    static let date = Date()
    static let observedDate = Date()
    static let isPublic = true
    static let countryCode = "ES"

    static let instance = HolidayDTO(
        id: id,
        name: name,
        date: date,
        observedDate: observedDate,
        isPublic: isPublic,
        countryCode: countryCode
    )
}
