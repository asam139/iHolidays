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

public class HolidaysApiServiceImpl: MoyaProvider<HolidaysApi>, HolidaysApiService {
    let baseURL: URL
    let apiKey: String
    
    public init(baseURL: URL, apiKey: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }
    
    private func getTargetType(_ route: HolidaysApi.Target) -> HolidaysApi {
        .init(baseURL: baseURL, apiKey: apiKey, route: route)
    }
    
    func getHolidays(country: String, year: UInt) -> Single<[HolidayDTO]> {
        rx.request(getTargetType(.getHolidays(country: country, year: year)))
            .map(HolidayResponseDTO.self)
            .map { $0.holidays ?? [] }
    }
}
