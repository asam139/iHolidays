//
//  HolidayTests.swift
//  iHolidaysDomain
//
//  Created by Saúl Moreno Abril on 28/2/21.
//

import Quick
import Nimble
import iHolidaysDomain

class HolidayTests: QuickSpec {
    override func spec() {
        describe("Holidays") {
            it("can be initialized") {
                let instance = Holiday(
                    id: HolidayFake.id,
                    name: HolidayFake.name,
                    date: HolidayFake.date,
                    observedDate: HolidayFake.observedDate,
                    isPublic: HolidayFake.isPublic,
                    countryCode: HolidayFake.countryCode
                )
                
                expect(instance.id) == HolidayFake.id
                expect(instance.name) == HolidayFake.name
                expect(instance.date) == HolidayFake.date
                expect(instance.observedDate) == HolidayFake.observedDate
                expect(instance.isPublic) == HolidayFake.isPublic
                expect(instance.countryCode) == HolidayFake.countryCode
            }
        }
    }
}
