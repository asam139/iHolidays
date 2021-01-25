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
    
    public func getHolidays() -> Single<[Holiday]> {
        repository.getHolidays()
    }
}
