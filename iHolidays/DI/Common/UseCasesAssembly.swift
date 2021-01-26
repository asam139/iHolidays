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
        container.register(UserUseCase.self) { r in
            let repo = container.resolve(HolidaysRepository.self)!
            return UserUseCaseImpl(repository: repo)
        }
    }
}
