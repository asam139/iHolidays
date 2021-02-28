//
//  PicsumRepositoryImplTests.swift
//  iHolidaysData-Unit-Tests
//
//  Created by Saúl Moreno Abril on 28/2/21.
//

import Quick
import Nimble
import RxSwift
import RxBlocking
@testable import iHolidaysData

class PicsumRepositoryImplTests: QuickSpec {
    override func spec() {
        describe("PicsumRepositoryImpl") {
            var service: PicsumApiServiceMock!
            var sut: PicsumRepositoryImpl!
            let testURL = URL(string: "https://test.com")!
            
            beforeEach {
                service = PicsumApiServiceMock()
                sut = PicsumRepositoryImpl(service: service)
            }

            it("get images by page") {
                let page: UInt = 0
                let limit: UInt = 100
                let returnValue = [PicsumImageDTOFake.instance]
                
                service.getImagesPageLimitReturnValue = .just(returnValue)
                let result = try? sut.getImages(page: page, limit: limit).toBlocking().single()
                expect(service.getImagesPageLimitCalled) == true
                expect(service.getImagesPageLimitReceivedArguments?.page) == page
                expect(service.getImagesPageLimitReceivedArguments?.limit) == limit
                expect(result) == returnValue.map { $0.toDomain() }
            }
            
            it("get image url by id") {
                let id = "0"
                let size: UInt = 100
                let returnValue = testURL
                
                service.getImageURLByIdWidthHeightReturnValue = .just(returnValue)
                let result = try? sut.getImageURLBy(id: id, width: size, height: size).toBlocking().single()
                expect(service.getImageURLByIdWidthHeightCalled) == true
                expect(service.getImageURLByIdWidthHeightReceivedArguments?.id) == id
                expect(service.getImageURLByIdWidthHeightReceivedArguments?.width) == size
                expect(service.getImageURLByIdWidthHeightReceivedArguments?.height) == size
                expect(result) == returnValue
            }
            
            it("get image url by id") {
                let size: UInt = 100
                let returnValue = testURL
                
                service.getRandomImageURLWidthHeightReturnValue = .just(returnValue)
                
                let result = try? sut.getRandomImageURL(width: size, height: size).toBlocking().single()
                expect(service.getRandomImageURLWidthHeightCalled) == true
                expect(service.getRandomImageURLWidthHeightReceivedArguments?.width) == size
                expect(service.getRandomImageURLWidthHeightReceivedArguments?.height) == size
                expect(result) == returnValue
            }
        }
    }
}


