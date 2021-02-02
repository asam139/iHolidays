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
    
    public func getHolidays(country: String, year: UInt) -> Single<[HolidayDTO]> {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.yearMonthDay)
        //decoder.dateDecodingStrategy = .iso8601 // Error
        
        return provider.rx.request(createAction(.getHolidays(country: country, year: year)))
            .map(HolidayResponseDTO.self, using: decoder)
            .map { $0.holidays ?? [] }
    }
}

private extension HolidaysApiServiceImpl {
    func createAction(_ action: HolidaysApi.Action) -> HolidaysApi {
        .init(baseURL: baseURL, apiKey: apiKey, action: action)
    }
}
