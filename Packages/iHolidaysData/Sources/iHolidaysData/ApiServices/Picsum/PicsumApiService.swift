//
//  PicsumApiService.swift
//
//
//  Created by Saúl Moreno Abril on 6/2/21.
//

import Foundation
import RxSwift
import iHolidaysDomain

public protocol PicsumApiService {
    func getImages(page: UInt, limit: UInt) -> Single<[PicsumImageDTO]>
    func getImageURLBy(id: String, width: UInt, height: UInt) -> Single<URL>
    func getRandomImageURL(width: UInt, height: UInt) -> Single<URL>
}
