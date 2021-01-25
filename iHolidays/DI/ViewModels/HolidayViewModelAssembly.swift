//
//  HolidayViewModelAssembly.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import Swinject

class HolidayViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HolidayViewModel.self) { r, router, holiday in
            HolidayViewModelImpl(router: router, holiday: holiday)
        }
    }
}
