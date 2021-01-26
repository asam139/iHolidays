//
//  HomeViewModel.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import RxSwift
import iHolidaysDomain

struct HolidaysViewModelInput {
    var fetchHolidaysTrigger: AnyObserver<Void>
    var selectHoliday: AnyObserver<Holiday>
}

struct HolidaysViewModelOutput {
    let holidays: Observable<[Holiday]>
}
