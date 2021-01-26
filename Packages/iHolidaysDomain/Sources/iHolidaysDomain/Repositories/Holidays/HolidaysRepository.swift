//
//  HolidaysRepository.swift
//  
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import RxSwift

public protocol HolidaysRepository {
    func getHolidays(country: String, year: UInt) -> Single<[Holiday]>
}
