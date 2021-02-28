//
//  FetchPicsumUseCaseImplTests.swift
//  iHolidaysDomain-Unit-Tests
//
//  Created by Saúl Moreno Abril on 28/2/21.
//

import Quick
import Nimble
import RxSwift
import RxBlocking
import iHolidaysDomain

class FetchPicsumUseCaseImplTests: QuickSpec {
    override func spec() {
        describe("FetchPicsumUseCaseImpl") {
            var repo: PicsumRepositoryMock!
            var sut: FetchPicsumUseCaseImpl!
            let testURL = URL(string: "https://test.com")!
            
            beforeEach {
                repo = PicsumRepositoryMock()
                sut = FetchPicsumUseCaseImpl(repository: repo)
            }
            
            context("get images by page") {
                it("with default values") {
                    let returnValue = [PicsumImageFake.instance]
                    
                    repo.getImagesPageLimitReturnValue = .just(returnValue)
                    let result = try? sut.getImages().toBlocking().single()
                    expect(repo.getImagesPageLimitCalled) == true
                    expect(result) == returnValue
                }
                
                it("with custom values") {
                    let page: UInt = 0
                    let limit: UInt = 100
                    let returnValue = [PicsumImageFake.instance]
                    
                    repo.getImagesPageLimitReturnValue = .just(returnValue)
                    let result = try? sut.getImages(page: page, limit: limit).toBlocking().single()
                    expect(repo.getImagesPageLimitCalled) == true
                    expect(repo.getImagesPageLimitReceivedArguments?.page) == page
                    expect(repo.getImagesPageLimitReceivedArguments?.limit) == limit
                    expect(result) == returnValue
                }
            }
            
            context("get image url by id") {
                it("with default values") {
                    let id = "0"
                    let returnValue = testURL
                    
                    repo.getImageURLByIdWidthHeightReturnValue = .just(returnValue)
                    let result = try? sut.getImageURLBy(id: id).toBlocking().single()
                    expect(repo.getImageURLByIdWidthHeightCalled) == true
                    expect(repo.getImageURLByIdWidthHeightReceivedArguments?.id) == id
                    expect(result) == returnValue
                }
                
                it("with custom values") {
                    let id = "0"
                    let size: UInt = 100
                    let returnValue = testURL
                    
                    repo.getImageURLByIdWidthHeightReturnValue = .just(returnValue)
                    let result = try? sut.getImageURLBy(id: id, width: size, height: size).toBlocking().single()
                    expect(repo.getImageURLByIdWidthHeightCalled) == true
                    expect(repo.getImageURLByIdWidthHeightReceivedArguments?.id) == id
                    expect(repo.getImageURLByIdWidthHeightReceivedArguments?.width) == size
                    expect(repo.getImageURLByIdWidthHeightReceivedArguments?.height) == size
                    expect(result) == returnValue
                }
            }
            
            context("get image url by id") {
                it("with default values") {
                    let returnValue = testURL
                    
                    repo.getRandomImageURLWidthHeightReturnValue = .just(returnValue)
                    let result = try? sut.getRandomImage().toBlocking().single()
                    expect(repo.getRandomImageURLWidthHeightCalled) == true
                    expect(result) == returnValue
                }
                
                it("with custom values") {
                    let size: UInt = 100
                    let returnValue = testURL
                    
                    repo.getRandomImageURLWidthHeightReturnValue = .just(returnValue)
                    let result = try? sut.getRandomImage(width: size, height: size).toBlocking().single()
                    expect(repo.getRandomImageURLWidthHeightCalled) == true
                    expect(repo.getRandomImageURLWidthHeightReceivedArguments?.width) == size
                    expect(repo.getRandomImageURLWidthHeightReceivedArguments?.height) == size
                    expect(result) == returnValue
                }
            }
        }
    }
}
