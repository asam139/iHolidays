//
//  UseCasesAssembly.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import iHolidaysData
import iHolidaysDomain
import Swinject

class UseCasesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(FetchHolidaysUseCase.self) { _ in
            let repo = container.resolve(HolidaysRepository.self)!
            return FetchHolidaysUseCaseImpl(repository: repo)
        }

        container.register(FetchPicsumUseCase.self) { _ in
            let repo = container.resolve(PicsumRepository.self)!
            return FetchPicsumUseCaseImpl(repository: repo)
        }
    }
}
