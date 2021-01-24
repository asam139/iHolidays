//
//  HomeViewModel.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import RxSwift
import RxRelay

enum HolidaysViewModelAction {
    case fetch
}

struct HolidaysViewModelInput {
    var action: AnyObserver<HolidaysViewModelAction>
}

struct HolidaysViewModelOutput {
    let holidays: Observable<[String]>
}

protocol HolidaysViewModel {
    var input: HolidaysViewModelInput { get }
    var output: HolidaysViewModelOutput { get }
}
