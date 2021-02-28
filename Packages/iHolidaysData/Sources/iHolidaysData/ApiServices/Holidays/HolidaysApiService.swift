//
//  HolidaysService.swift
//
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import RxSwift

public protocol HolidaysApiService {
    func getHolidays(country: String, year: UInt) -> Single<[HolidayDTO]>
}
