//
//  Config.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import Foundation

class Config {
    // MARK: - Holidays Api
    @BundleInfoURL(key: "HOLIDAYS_API_BASE_URL") static var holidaysApiBaseURL: URL
    @BundleInfo(key: "HOLIDAYS_API_KEY") static var holidaysApiKey: String
    
    // MARK: - Picsum Api
    @BundleInfoURL(key: "PICSUM_API_BASE_URL") static var picsumApiBaseURL: URL
}
