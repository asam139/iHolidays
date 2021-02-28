//
//  RepositoriesAssembly.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import Swinject
import iHolidaysDomain
import iHolidaysData

class RepositoriesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HolidaysRepository.self) { r in
            let service = container.resolve(HolidaysApiService.self)!
            return HolidaysRepositoryImpl(service: service)
        }
        
        container.register(PicsumRepository.self) { r in
            let service = container.resolve(PicsumApiService.self)!
            return PicsumRepositoryImpl(service: service)
        }
    }
}
