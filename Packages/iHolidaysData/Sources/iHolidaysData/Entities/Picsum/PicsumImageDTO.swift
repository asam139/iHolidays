//
//  File.swift
//  
//
//  Created by Saúl Moreno Abril on 6/2/21.
//

import Foundation
import iHolidaysDomain

public struct PicsumImageDTO: Decodable {
    public let id: String?
    public let author: String?
    public let width: Int?
    public let height: Int?
    
    public init(
        id: String?,
        author: String?,
        width: Int?,
        height: Int?
    ) {
        self.id = id
        self.author = author
        self.width = width
        self.height = height
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case author
        case width
        case height
    }
}

extension PicsumImageDTO {
    func toDomain() -> PicsumImage {
        PicsumImage(
            id: id ?? UUID().uuidString,
            author: author ?? "",
            width: width ?? 0,
            height: height ?? 0
        )
    }
}



