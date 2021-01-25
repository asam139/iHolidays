//
//  ServicesAssembly.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import Swinject
import Moya
import iHolidaysData

class ServicesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HolidaysApiService.self) { _ in
            HolidaysApiServiceImpl(
                baseURL: Config.holidaysApiBaseURL,
                apiKey: Config.holidaysApiKey,
                provider: .init(stubClosure: MoyaProvider.delayedStub(0.1))
            )
        }
    }
}
