//
//  FetchHolidaysUseCase.swift
//  
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import Foundation
import RxSwift

public protocol FetchHolidaysUseCase {
    func getHolidays(country: String, year: UInt) -> Single<[Holiday]>
}
