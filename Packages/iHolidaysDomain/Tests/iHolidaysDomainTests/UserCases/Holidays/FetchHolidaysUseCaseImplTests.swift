//
//  FetchHolidaysUseCaseImplTests.swift
//  iHolidaysDomain-Unit-Tests
//
//  Created by Saúl Moreno Abril on 28/2/21.
//

import Quick
import Nimble
import RxSwift
import RxBlocking
import iHolidaysDomain

class FetchHolidaysUseCaseImplTests: QuickSpec {
    override func spec() {
        describe("FetchHolidaysUseCaseImpl") {
            var repo: HolidaysRepositoryMock!
            var sut: FetchHolidaysUseCaseImpl!
            
            beforeEach {
                repo = HolidaysRepositoryMock()
                sut = FetchHolidaysUseCaseImpl(repository: repo)
            }

            it("get holidays by country and year") {
                let country = "ES"
                let year: UInt = 2020
                let returnValue = [HolidayFake.instance]
                
                repo.getHolidaysCountryYearReturnValue = .just(returnValue)
                let result = try? sut.getHolidays(country: country, year:  year).toBlocking().single()
                expect(repo.getHolidaysCountryYearCalled) == true
                expect(repo.getHolidaysCountryYearReceivedArguments?.country) == country
                expect(repo.getHolidaysCountryYearReceivedArguments?.year) == year
                expect(result) == returnValue
            }
        }
    }
}
