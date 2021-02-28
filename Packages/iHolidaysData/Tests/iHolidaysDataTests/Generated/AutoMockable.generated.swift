// Generated using Sourcery 1.2.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable line_length
// swiftlint:disable variable_name
import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif
import RxSwift
import iHolidaysData

class HolidaysApiServiceMock: HolidaysApiService {
    //MARK: - getHolidays
    var getHolidaysCountryYearCallsCount = 0
    var getHolidaysCountryYearCalled: Bool {
        return getHolidaysCountryYearCallsCount > 0
    }
    var getHolidaysCountryYearReceivedArguments: (country: String, year: UInt)?
    var getHolidaysCountryYearReceivedInvocations: [(country: String, year: UInt)] = []
    var getHolidaysCountryYearReturnValue: Single<[HolidayDTO]>!
    var getHolidaysCountryYearClosure: ((String, UInt) -> Single<[HolidayDTO]>)?
    func getHolidays(country: String, year: UInt) -> Single<[HolidayDTO]> {
        getHolidaysCountryYearCallsCount += 1
        getHolidaysCountryYearReceivedArguments = (country: country, year: year)
        getHolidaysCountryYearReceivedInvocations.append((country: country, year: year))
        return getHolidaysCountryYearClosure.map({ $0(country, year) }) ?? getHolidaysCountryYearReturnValue
    }
}
class PicsumApiServiceMock: PicsumApiService {
    //MARK: - getImages
    var getImagesPageLimitCallsCount = 0
    var getImagesPageLimitCalled: Bool {
        return getImagesPageLimitCallsCount > 0
    }
    var getImagesPageLimitReceivedArguments: (page: UInt, limit: UInt)?
    var getImagesPageLimitReceivedInvocations: [(page: UInt, limit: UInt)] = []
    var getImagesPageLimitReturnValue: Single<[PicsumImageDTO]>!
    var getImagesPageLimitClosure: ((UInt, UInt) -> Single<[PicsumImageDTO]>)?
    func getImages(page: UInt, limit: UInt) -> Single<[PicsumImageDTO]> {
        getImagesPageLimitCallsCount += 1
        getImagesPageLimitReceivedArguments = (page: page, limit: limit)
        getImagesPageLimitReceivedInvocations.append((page: page, limit: limit))
        return getImagesPageLimitClosure.map({ $0(page, limit) }) ?? getImagesPageLimitReturnValue
    }
    //MARK: - getImageURLBy
    var getImageURLByIdWidthHeightCallsCount = 0
    var getImageURLByIdWidthHeightCalled: Bool {
        return getImageURLByIdWidthHeightCallsCount > 0
    }
    var getImageURLByIdWidthHeightReceivedArguments: (id: String, width: UInt, height: UInt)?
    var getImageURLByIdWidthHeightReceivedInvocations: [(id: String, width: UInt, height: UInt)] = []
    var getImageURLByIdWidthHeightReturnValue: Single<URL>!
    var getImageURLByIdWidthHeightClosure: ((String, UInt, UInt) -> Single<URL>)?
    func getImageURLBy(id: String, width: UInt, height: UInt) -> Single<URL> {
        getImageURLByIdWidthHeightCallsCount += 1
        getImageURLByIdWidthHeightReceivedArguments = (id: id, width: width, height: height)
        getImageURLByIdWidthHeightReceivedInvocations.append((id: id, width: width, height: height))
        return getImageURLByIdWidthHeightClosure.map({ $0(id, width, height) }) ?? getImageURLByIdWidthHeightReturnValue
    }
    //MARK: - getRandomImageURL
    var getRandomImageURLWidthHeightCallsCount = 0
    var getRandomImageURLWidthHeightCalled: Bool {
        return getRandomImageURLWidthHeightCallsCount > 0
    }
    var getRandomImageURLWidthHeightReceivedArguments: (width: UInt, height: UInt)?
    var getRandomImageURLWidthHeightReceivedInvocations: [(width: UInt, height: UInt)] = []
    var getRandomImageURLWidthHeightReturnValue: Single<URL>!
    var getRandomImageURLWidthHeightClosure: ((UInt, UInt) -> Single<URL>)?
    func getRandomImageURL(width: UInt, height: UInt) -> Single<URL> {
        getRandomImageURLWidthHeightCallsCount += 1
        getRandomImageURLWidthHeightReceivedArguments = (width: width, height: height)
        getRandomImageURLWidthHeightReceivedInvocations.append((width: width, height: height))
        return getRandomImageURLWidthHeightClosure.map({ $0(width, height) }) ?? getRandomImageURLWidthHeightReturnValue
    }
}
