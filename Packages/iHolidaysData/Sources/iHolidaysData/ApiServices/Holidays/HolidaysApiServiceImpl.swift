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
    
    public init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    func getHolidays() -> Single<HolidayDTO> {
        rx.request(.init(baseURL: baseURL, route: .getHolidays)).map(HolidayDTO.self)
    }
}
