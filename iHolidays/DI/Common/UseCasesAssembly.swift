//
//  UseCasesAssembly.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import Swinject
import iHolidaysDomain
import iHolidaysData

class UseCasesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(FetchHolidaysUseCase.self) { r in
            let repo = container.resolve(HolidaysRepository.self)!
            return FetchHolidaysUseCaseImpl(repository: repo)
        }
        
        container.register(FetchPicsumUseCase.self) { r in
            let repo = container.resolve(PicsumRepository.self)!
            return FetchPicsumUseCaseImpl(repository: repo)
        }
    }
}
