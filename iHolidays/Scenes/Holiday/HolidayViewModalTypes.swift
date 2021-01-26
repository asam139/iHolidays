//
//  HolidayViewModal.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import RxSwift

struct HolidayViewModelInput {
    var dismissTrigger: AnyObserver<Void>
}

struct HolidayViewModelOutput {
    let holiday: Observable<String>
}

