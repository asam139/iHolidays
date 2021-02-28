//
//  RepositoriesAssembly.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import iHolidaysData
import iHolidaysDomain
import Swinject

class RepositoriesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HolidaysRepository.self) { _ in
            let service = container.resolve(HolidaysApiService.self)!
            return HolidaysRepositoryImpl(service: service)
        }

        container.register(PicsumRepository.self) { _ in
            let service = container.resolve(PicsumApiService.self)!
            return PicsumRepositoryImpl(service: service)
        }
    }
}
