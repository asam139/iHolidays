//
//  PicsumImageDTOTests.swift
//  iHolidaysData-Unit-Tests
//
//  Created by Saúl Moreno Abril on 28/2/21.
//

import Quick
import Nimble
@testable import iHolidaysData

class PicsumImageDTOTests: QuickSpec {
    override func spec() {
        describe("PicsumImageDTO") {
            let instance = PicsumImageDTO(
                id: PicsumImageDTOFake.id,
                author: PicsumImageDTOFake.author,
                width: PicsumImageDTOFake.width,
                height: PicsumImageDTOFake.height
            )
            
            it("can be initialized") {
                expect(instance.id) == PicsumImageDTOFake.id
                expect(instance.author) == PicsumImageDTOFake.author
                expect(instance.width) == PicsumImageDTOFake.width
                expect(instance.height) == PicsumImageDTOFake.height
            }
            
            context("can be mapped to domain") {
                it("with valid fields") {
                    let domain = instance.toDomain()
                    expect(domain.id) == instance.id
                    expect(domain.author) == instance.author
                    expect(domain.width) == instance.width
                    expect(domain.height) == instance.height
                }
                
                it("with invalid fields") {
                    let invalidInstance = PicsumImageDTO(
                        id: nil,
                        author: nil,
                        width: nil,
                        height: nil
                    )
                    
                    let domain = invalidInstance.toDomain()
                    expect(domain.id).notTo(beEmpty())
                    expect(domain.author).to(beEmpty())
                    expect(domain.width) == 0
                    expect(domain.height) == 0
                }
            }
        }
    }
}
