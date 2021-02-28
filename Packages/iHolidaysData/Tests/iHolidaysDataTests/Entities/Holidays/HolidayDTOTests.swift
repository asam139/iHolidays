//
//  HolidayDTOTests.swift
//  iHolidaysData-Unit-Tests
//
//  Created by Saúl Moreno Abril on 28/2/21.
//

import Quick
import Nimble
@testable import iHolidaysData

class HolidayDTOTests: QuickSpec {
    override func spec() {
        describe("HolidayDTO") {
            let instance = HolidayDTO(
                id: HolidayDTOFake.id,
                name: HolidayDTOFake.name,
                date: HolidayDTOFake.date,
                observedDate: HolidayDTOFake.observedDate,
                isPublic: HolidayDTOFake.isPublic,
                countryCode: HolidayDTOFake.countryCode
            )
            
            it("can be initialized") {
                expect(instance.id) == HolidayDTOFake.id
                expect(instance.name) == HolidayDTOFake.name
                expect(instance.date) == HolidayDTOFake.date
                expect(instance.observedDate) == HolidayDTOFake.observedDate
                expect(instance.isPublic) == HolidayDTOFake.isPublic
                expect(instance.countryCode) == HolidayDTOFake.countryCode
            }
            
            context("can be mapped to domain") {
                it("with valid fields") {
                    let domain = instance.toDomain()
                    expect(domain.id) == instance.id
                    expect(instance.name) == instance.name
                    expect(instance.date) == instance.date
                    expect(instance.observedDate) == instance.observedDate
                    expect(instance.isPublic) == instance.isPublic
                    expect(instance.countryCode) == instance.countryCode
                }
                
                it("with invalid fields") {
                    let invalidInstance = HolidayDTO(
                        id: nil,
                        name: nil,
                        date: nil,
                        observedDate: nil,
                        isPublic: nil,
                        countryCode: nil
                    )
                    
                    let domain = invalidInstance.toDomain()
                    expect(domain.id).notTo(beEmpty())
                    expect(domain.name).to(beEmpty())
                    expect(domain.date).toNot(beNil())
                    expect(domain.observedDate).toNot(beNil())
                    expect(domain.isPublic) == true
                    expect(domain.countryCode).to(beEmpty())
                }
            }
        }
    }
}
