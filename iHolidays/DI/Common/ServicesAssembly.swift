//
//  ServicesAssembly.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import iHolidaysData
import Moya
import Swinject

class ServicesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HolidaysApiService.self) { _ in
            HolidaysApiServiceImpl(
                baseURL: Config.holidaysApiBaseURL,
                apiKey: Config.holidaysApiKey,
                provider: .init(stubClosure: MoyaProvider.delayedStub(0.1))
            )
        }

        container.register(PicsumApiService.self) { _ in
            PicsumApiServiceImpl(
                baseURL: Config.picsumApiBaseURL,
                provider: .init(stubClosure: MoyaProvider.delayedStub(0.1))
            )
        }
    }
}
