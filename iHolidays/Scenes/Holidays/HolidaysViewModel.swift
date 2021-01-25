//
//  HomeViewModel.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import RxSwift

struct HolidaysViewModelInput {
    var fetchHolidaysTrigger: AnyObserver<Void>
    var selectHoliday: AnyObserver<String>
}

struct HolidaysViewModelOutput {
    let holidays: Observable<[String]>
}

protocol HolidaysViewModel {
    var input: HolidaysViewModelInput { get }
    var output: HolidaysViewModelOutput { get }
}
