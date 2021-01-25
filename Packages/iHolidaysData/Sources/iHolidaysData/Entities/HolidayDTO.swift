//
//  HolidayDTO.swift
//
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import Foundation
import iHolidaysDomain

struct HolidayDTO: Decodable {
    let id: String?
    let name: String?
    let date: Date?
    let observedDate: Date?
    let isPublic: Bool?
    let countryCode: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case date
        case observedDate = "observed"
        case isPublic = "public"
        case countryCode = "country"
    }
}

extension HolidayDTO {
    func toDomain() -> Holiday {
        Holiday(
            id: id ?? UUID().uuidString,
            name: name ?? "",
            date: date ?? Date(),
            observedDate: observedDate ?? Date(),
            isPublic: isPublic ?? true,
            countryCode: countryCode ?? "ES"
        )
    }
}
