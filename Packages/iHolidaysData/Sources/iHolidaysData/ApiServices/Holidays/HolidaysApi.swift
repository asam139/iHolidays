//
//  HolidaysApi.swift
//
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import Foundation
import Moya

public struct HolidaysApi: BaseTargetType {
    public let mainBaseURL: URL
    public let apiKey: String
    public let action: Action

    public enum Action {
        case getHolidays(country: String, year: UInt)
    }

    public var baseURL: URL { mainBaseURL }

    public var path: String {
        switch action {
        case .getHolidays:
            return "/holidays"
        }
    }

    public var method: Moya.Method {
        switch action {
        case .getHolidays:
            return .get
        }
    }

    private var parameters: [String: Any] {
        var parameters = [String: Any]()
        parameters["key"] = apiKey

        switch action {
        case .getHolidays(let country, let year):
            parameters["country"] = country
            parameters["year"] = String(year)
        }

        return parameters
    }

    public var task: Task {
        switch action {
        case .getHolidays:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }

    public var sampleData: Data {
        let name: String
        switch action {
        case .getHolidays:
            name = "holidaysStub"
        }

        guard let url = Bundle.own.url(forResource: name, withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return Data()
        }

        return data
    }

    public var headers: [String: String]? {
        [
            "Content-type": "application/json",
            "key": apiKey
        ]
    }
}
