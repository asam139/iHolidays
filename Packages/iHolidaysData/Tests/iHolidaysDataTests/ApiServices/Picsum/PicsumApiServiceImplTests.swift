//
//  PicsumApiServiceImplTests.swift
//
//
//  Created by Saúl Moreno Abril on 6/2/21.
//

import Quick
import Nimble
import RxSwift
import RxBlocking
import Moya
import iHolidaysData

class PicsumApiServiceImplTests: QuickSpec {
    override func spec() {
        describe("PicsumApiServiceImpl") {
            var provider: MoyaProvider<PicsumApi>!
            var sut: PicsumApiServiceImpl!
            let baseURL = URL(string: "https://test.com")!
            
            beforeEach {
                provider = MoyaProvider(stubClosure: MoyaProvider.delayedStub(0.1))
                sut = PicsumApiServiceImpl(baseURL: baseURL, provider: provider)
            }

            it("get images by page") {
                let page: UInt = 0
                let limit: UInt = 100
                
                let result = try? sut.getImages(page: page, limit: limit).toBlocking().single()
                expect(result).notTo(beEmpty())
            }
            
            it("get image url by id") {
                let id = "0"
                let size: UInt = 100
                
                let result = try? sut.getImageURLBy(id: id, width: size, height: size).toBlocking().single()
                expect(result).notTo(beNil())
            }
            
            it("get image url by id") {
                let size: UInt = 100
                let result = try? sut.getRandomImageURL(width: size, height: size).toBlocking().single()
                expect(result).notTo(beNil())
            }
        }
    }
}
