//
//  PicsumImageTests.swift
//  iHolidaysDomain-Unit-Tests
//
//  Created by Saúl Moreno Abril on 28/2/21.
//

import Quick
import Nimble
import iHolidaysDomain

class PicsumImageTests: QuickSpec {
    override func spec() {
        describe("PicsumImage") {
            it("can be initialized") {
                let instance = PicsumImage(
                    id: PicsumImageFake.id,
                    author: PicsumImageFake.author,
                    width: PicsumImageFake.width,
                    height: PicsumImageFake.height
                )
                
                expect(instance.id) == PicsumImageFake.id
                expect(instance.author) == PicsumImageFake.author
                expect(instance.width) == PicsumImageFake.width
                expect(instance.height) == PicsumImageFake.height
            }
        }
    }
}
