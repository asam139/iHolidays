//
//  HolidayViewModal.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import RxSwift

enum HolidayViewModelAction {
    case viewWillAppear
    case done
}

struct HolidayViewModelInput {
    var action: AnyObserver<HolidayViewModelAction>
}

struct HolidayViewModelOutput {
    let holiday: Observable<String>
}

protocol HolidayViewModel {
    var input: HolidayViewModelInput { get }
    var output: HolidayViewModelOutput { get }
}

