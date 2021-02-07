//
//  PicsumRepositoryImpl.swift
//  
//
//  Created by Saúl Moreno Abril on 6/2/21.
//

import Foundation
import RxSwift
import Moya
import iHolidaysDomain

public class PicsumRepositoryImpl: PicsumRepository {
    private let service: PicsumApiService
    
    public init(service: PicsumApiService) {
        self.service = service
    }
    
    public func getImages(page: UInt, limit: UInt) -> Single<[PicsumImage]> {
        service.getImages(page: page, limit: limit).map {
            $0.map { h in h.toDomain() }
        }
    }
    
    public func getImageURLBy(id: String, width: UInt, height: UInt) -> Single<URL> {
        service.getImageURLBy(id: id, width: width, height: height)
    }
    
    public func getRandomImageURL(width: UInt, height: UInt) -> Single<URL> {
        service.getRandomImageURL(width: width, height: height)
    }
    
}
