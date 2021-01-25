//
//  File.swift
//  
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import RxSwift

public protocol UserUseCase {
    func getHolidays(country: String, year: UInt) -> Single<[Holiday]>
}

