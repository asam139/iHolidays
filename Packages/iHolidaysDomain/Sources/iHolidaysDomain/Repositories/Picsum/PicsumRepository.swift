//
//  PicsumRepository.swift
//
//
//  Created by Saúl Moreno Abril on 6/2/21.
//

import Foundation
import RxSwift

public protocol PicsumRepository {
    func getImages(page: UInt, limit: UInt) -> Single<[PicsumImage]>
    func getImageURLBy(id: String, width: UInt, height: UInt) -> Single<URL>
    func getRandomImageURL(width: UInt, height: UInt) -> Single<URL>
}
