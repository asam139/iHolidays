//
//  HolidaysRepositoryImplTests.swift
//  iHolidaysData-Unit-Tests
//
//  Created by Saúl Moreno Abril on 28/2/21.
//

import Quick
import Nimble
import RxSwift
import RxBlocking
@testable import iHolidaysData

class HolidaysRepositoryImplTests: QuickSpec {
    override func spec() {
        describe("HolidayRepositoryImpl") {
            var service: HolidaysApiServiceMock!
            var sut: HolidaysRepositoryImpl!
            
            beforeEach {
                service = HolidaysApiServiceMock()
                sut = HolidaysRepositoryImpl(service: service)
            }

            it("get holidays by country and year") {
                let country = "ES"
                let year: UInt = 2020
                let returnValue = [HolidayDTOFake.instance]

                service.getHolidaysCountryYearReturnValue = .just(returnValue)
                let result = try? sut.getHolidays(country: country, year:  year).toBlocking().single()
                expect(service.getHolidaysCountryYearCalled) == true
                expect(service.getHolidaysCountryYearReceivedArguments?.country) == country
                expect(service.getHolidaysCountryYearReceivedArguments?.year) == year
                expect(result) == returnValue.map { $0.toDomain() }
            }
        }
    }
}
