//
//  File.swift
//  
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import RxSwift

public class UserUseCaseImpl: UserUseCase {
    let repository: HolidaysRepository
    
    public init(repository: HolidaysRepository) {
        self.repository = repository
    }
    
    public func getHolidays(country: String, year: UInt) -> Single<[Holiday]> {
        repository.getHolidays(country: country, year: year)
    }
}
