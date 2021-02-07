//
//  HomeViewModel.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import Foundation
import RxSwift
import iHolidaysDomain

struct HolidaysViewModelInput {
    var fetchHolidaysTrigger: AnyObserver<Void>
    var selectHoliday: AnyObserver<Holiday>
}

typealias HolidayWithImage = (holiday: Holiday, imageURL: URL)

struct HolidaysViewModelOutput {
    let holidays: Observable<[HolidayWithImage]>
}
