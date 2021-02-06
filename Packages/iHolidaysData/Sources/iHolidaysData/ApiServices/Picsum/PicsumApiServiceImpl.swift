//
//  PicsumApiServiceImpl.swift
//  
//
//  Created by Saúl Moreno Abril on 6/2/21.
//

import Foundation
import RxSwift
import Moya
import RxMoya

public class PicsumApiServiceImpl: PicsumApiService {
    let baseURL: URL
    let provider: MoyaProvider<PicsumApi>
    
    public init(baseURL: URL, provider: MoyaProvider<PicsumApi>) {
        self.baseURL = baseURL
        self.provider = provider
    }
    
    public func getImages(page: UInt, limit: UInt) -> Single<[PicsumImageDTO]> {
        provider.rx.request(createAction(.getImages(page: page, limit: limit)))
            .map([PicsumImageDTO].self)
    }
    
    public func getImageURLBy(id: String, width: UInt, height: UInt) -> Single<URL> {
        let action = createAction(.getImage(id: id, width: width, height: height))
        return .just(URL(target: action))
    }
    
    public func getRandomImageURL(width: UInt, height: UInt) -> Single<URL> {
        let action = createAction(.getRandomImage(width: width, height: height))
        return .just(URL(target: action))
    }
}

private extension PicsumApiServiceImpl {
    func createAction(_ action: PicsumApi.Action) -> PicsumApi {
        .init(mainBaseURL: baseURL, action: action)
    }
}
