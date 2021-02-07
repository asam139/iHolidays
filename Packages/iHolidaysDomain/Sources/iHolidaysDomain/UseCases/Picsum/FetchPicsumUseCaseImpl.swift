//
//  File.swift
//  
//
//  Created by Saúl Moreno Abril on 7/2/21.
//

import Foundation
import RxSwift

public class FetchPicsumUseCaseImpl: FetchPicsumUseCase {
    let repository: PicsumRepository
    
    public init(repository: PicsumRepository) {
        self.repository = repository
    }
    
    public func getImages(page: UInt, limit: UInt) -> Single<[PicsumImage]> {
        repository.getImages(page: page, limit: limit)
    }
    
    public func getImageURLBy(id: String, width: UInt, height: UInt) -> Single<URL> {
        repository.getImageURLBy(id: id, width: width, height: height)
    }
    
    public func getRandomImage(width: UInt, height: UInt) -> Single<URL> {
        repository.getRandomImageURL(width: width, height: height)
    }
}
