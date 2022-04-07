//
//  HomeViewModel.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import iHolidaysDomain
import RxCocoa
import RxDataSources
import RxSwift

extension HolidaysViewModel {
    struct Input {
        let fetchHolidaysTrigger: AnyObserver<Void>
        let selectHoliday: AnyObserver<Holiday>
    }
}

extension HolidaysViewModel {
    struct HolidayWithImage: Equatable, IdentifiableType {
        let holiday: Holiday
        let imageURL: URL

        var identity: String { holiday.id }
    }

    struct Section: AnimatableSectionModelType {
        let header: String
        let items: [HolidayWithImage]

        init(header: String, items: [HolidayWithImage]) {
            self.header = header
            self.items = items
        }

        init(original: Section, items: [HolidayWithImage]) {
            self.header = original.header
            self.items = items
        }

        var identity: String {
            return header
        }
    }

    struct Output {
        let sections: Driver<[Section]>
    }
}
