//
//  Container+.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import Foundation
import Swinject
import Moya
import iHolidaysData
import iHolidaysDomain

extension Container {
    static let shared: Container = {
        let container = Container()
        
        container.register(HolidaysApiService.self) { r in
            HolidaysApiServiceImpl(
                baseURL: Config.holidaysApiBaseURL,
                apiKey: Config.holidaysApiKey,
                provider: .init(stubClosure: MoyaProvider.delayedStub(0.1))
            )
        }
        
        container.register(HolidaysRepository.self) { r in
            let service = container.resolve(HolidaysApiService.self)!
            return HolidaysRepositoryImpl(service: service)
        }
        
        container.register(UserUseCase.self) { r in
            let repo = container.resolve(HolidaysRepository.self)!
            return UserUseCaseImpl(repository: repo)
        }
        
        return container
    }()
}
