//
//  HomeViewModel.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import iHolidaysDomain
import RxDataSources
import RxSwift

struct HolidaysViewModelInput {
    var fetchHolidaysTrigger: AnyObserver<Void>
    var selectHoliday: AnyObserver<Holiday>
}

struct HolidayWithImage: Equatable, IdentifiableType {
    let holiday: Holiday
    let imageURL: URL

    var identity: String { holiday.id }
}

struct HolidaysViewModelOutput {
    let holidays: Observable<[HolidayWithImage]>
}
