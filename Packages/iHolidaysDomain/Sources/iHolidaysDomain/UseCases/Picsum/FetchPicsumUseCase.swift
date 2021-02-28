//
//  FetchPicsumUseCase.swift
//
//
//  Created by Saúl Moreno Abril on 7/2/21.
//

import Foundation
import RxSwift

public protocol FetchPicsumUseCase {
    func getImages(page: UInt, limit: UInt) -> Single<[PicsumImage]>
    func getImageURLBy(id: String, width: UInt, height: UInt) -> Single<URL>
    func getRandomImage(width: UInt, height: UInt) -> Single<URL>
}

public extension FetchPicsumUseCase {
    func getImages(page: UInt = 0, limit: UInt = 30) -> Single<[PicsumImage]> {
        getImages(page: page, limit: limit)
    }

    func getImageURLBy(id: String, width: UInt = 600, height: UInt = 300) -> Single<URL> {
        getImageURLBy(id: id, width: width, height: height)
    }

    func getRandomImage(width: UInt = 600, height: UInt = 300) -> Single<URL> {
        getRandomImage(width: width, height: height)
    }
}
