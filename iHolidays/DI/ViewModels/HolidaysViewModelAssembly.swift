//
//  HolidaysViewModelAssembly.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import Swinject

class HolidaysViewModelAssembly: Assembly {
  func assemble(container: Container) {
    container.register(HolidaysViewModel.self) { r, router in
        HolidaysViewModelImpl(router: router, resolver: r)
    }
  }
}
