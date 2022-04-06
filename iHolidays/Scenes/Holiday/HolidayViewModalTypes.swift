//
//  HolidayViewModal.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import iHolidaysDomain
import RxSwift

struct HolidayViewModelInput {
    let dismissTrigger: AnyObserver<Void>
}

struct HolidayViewModelOutput {
    let holiday: Observable<Holiday>
}
