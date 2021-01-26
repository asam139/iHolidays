//
//  HolidaysApi.swift
//  
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import Foundation
import Moya

public struct HolidaysApi: TargetType {
    public let baseURL: URL
    public let apiKey: String
    public let route: Target

    public enum Target {
        case getHolidays(country: String, year: UInt)
    }
    
    public var path: String {
        switch route {
        case .getHolidays:
            return "/holidays"
        }
    }
    
    public var method: Moya.Method {
        switch route {
        case .getHolidays:
            return .get
        }
    }
    
    public var task: Task {
        switch route {
        case .getHolidays(let country, let year):
            let parameters = ["country": country, "year": String(year)]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }

    }
    
    public var sampleData: Data {
        let name: String
        switch route {
        case .getHolidays:
            name = "holidaysStub"
        }
        
        guard let url = Bundle.module.url(forResource: name, withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return Data()
        }

        return data
    }
    
    public var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
