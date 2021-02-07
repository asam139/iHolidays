//
//  PicsumApi.swift
//  
//
//  Created by Saúl Moreno Abril on 6/2/21.
//

import Foundation
import Moya

public struct PicsumApi: BaseTargetType {
    public let mainBaseURL: URL
    public let action: Action
    
    public enum Action {
        case getImages(page: UInt, limit: UInt)
        case getImage(id: String, width: UInt, height: UInt)
        case getRandomImage(width: UInt, height: UInt)
    }

    public var baseURL: URL { mainBaseURL }
 
    public var path: String {
        switch action {
        case .getImages:
            return "/v2/list"
        case .getImage(let id, let width, let height):
            return "/id/\(id)/\(width)/\(height)"
        case .getRandomImage(let width, let height):
            return "/\(width)/\(height)"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    private var parameters: [String: Any] {
        var parameters = [String: Any]()
        switch action {
        case .getImages(let page, let limit):
            parameters["page"] = page
            parameters["limit"] = limit
        case .getRandomImage:
            parameters["random"] = Int.random(in: 0..<Int.max)
        default:
            break
        }
        return parameters
    }
    
    public var task: Task {
        switch action {
        default:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    public var sampleData: Data {
        let name: String
        let withExtension: String
        switch action {
        case .getImages:
            name = "imagesStub"
            withExtension = "json"
        default:
            name = "randomImageStub"
            withExtension = "jpeg"
        }
        
        guard let url = Bundle.module.url(forResource: name, withExtension: withExtension),
              let data = try? Data(contentsOf: url) else {
            return Data()
        }

        return data
    }
    
    public var headers: [String : String]? { nil }
}
