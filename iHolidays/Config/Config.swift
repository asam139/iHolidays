//
//  Config.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import Foundation

class Config {
    // MARK: - Holidays Api
    static let holidaysApiBaseURL: URL = {
        getURL(forKey: "HOLIDAYS_API_BASE_URL")
    }()
    
    static let holidaysApiKey: String = {
        getString(forKey: "HOLIDAYS_API_KEY")
    }()
}

extension Config {
    private static let infoDictionary: [String: Any] = {
        Bundle.main.infoDictionary ?? [:]
    }()

    private static func getString(forKey key: String) -> String {
        (infoDictionary[key] as? String) ?? ""
    }
    
    private static func getURL(forKey key: String) -> URL {
        let string = getString(forKey: key)
        
        guard let url = URL(string: string) else {
            fatalError()
        }
        return url
    }
}
