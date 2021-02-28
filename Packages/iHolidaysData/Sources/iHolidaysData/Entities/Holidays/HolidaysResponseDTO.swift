//
//  HolidaysResponseDTO.swift
//
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import Foundation
import iHolidaysDomain

struct HolidayResponseDTO: Decodable {
    let status: Int?
    let holidays: [HolidayDTO]?

    enum CodingKeys: String, CodingKey {
        case status
        case holidays
    }
}
