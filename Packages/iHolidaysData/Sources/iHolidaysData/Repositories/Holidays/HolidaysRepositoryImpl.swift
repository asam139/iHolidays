//
//  File.swift
//  
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import RxSwift
import Moya
import iHolidaysDomain

class HolidaysRepositoryImpl: HolidaysRepository {
    private let service: HolidaysApiService
    
    init(service: HolidaysApiService) {
        self.service = service
    }
    
    func getHolidays(country: String, year: UInt) -> Single<[Holiday]> {
        service.getHolidays(country: country, year: year).map {
            $0.map { h in h.toDomain() }
        }
    }
}
