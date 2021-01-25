//
//  HolidaysApiServiceImpl.swift
//  
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import Foundation
import RxSwift
import Moya
import RxMoya

public class HolidaysApiServiceImpl: HolidaysApiService {
    let baseURL: URL
    let apiKey: String
    let provider: MoyaProvider<HolidaysApi>
    
    public init(baseURL: URL, apiKey: String, provider: MoyaProvider<HolidaysApi>) {
        self.baseURL = baseURL
        self.apiKey = apiKey
        self.provider = provider
    }
    
    private func getTargetType(_ route: HolidaysApi.Target) -> HolidaysApi {
        .init(baseURL: baseURL, apiKey: apiKey, route: route)
    }
    
    public func getHolidays(country: String, year: UInt) -> Single<[HolidayDTO]> {
        provider.rx.request(getTargetType(.getHolidays(country: country, year: year)))
            .map(HolidayResponseDTO.self)
            .map { $0.holidays ?? [] }
    }
}
