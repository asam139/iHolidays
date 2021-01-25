//
//  HolidaysService.swift
//  
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import RxSwift

protocol HolidaysApiService {
    func getHolidays() -> Single<HolidayDTO>
}
