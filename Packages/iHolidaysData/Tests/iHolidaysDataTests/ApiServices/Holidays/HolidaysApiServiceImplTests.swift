//
//  HolidaysApiServiceImplTests.swift
//
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import Quick
import Nimble
import RxSwift
import RxBlocking
import Moya
@testable import iHolidaysData

class HolidaysApiServiceImplTests: QuickSpec {
    override func spec() {
        describe("HolidaysApiServiceImpl") {
            var provider: MoyaProvider<HolidaysApi>!
            var sut: HolidaysApiServiceImpl!
            let baseURL = URL(string: "https://test.com")!
            let apiKey = "apiKey"
            
            beforeEach {
                provider = MoyaProvider(stubClosure: MoyaProvider.delayedStub(0.1))
                sut = HolidaysApiServiceImpl(baseURL: baseURL, apiKey: apiKey, provider: provider)
            }

            it("get holidays by country and year") {
                let country = "ES"
                let year: UInt = 2020
                let result = try? sut.getHolidays(country: country, year:  year).toBlocking().single()
                expect(result).toNot(beEmpty())
            }
        }
    }
}
