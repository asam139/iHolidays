//
//  PicsumImage.swift
//  
//
//  Created by Saúl Moreno Abril on 6/2/21.
//

import Foundation

public struct PicsumImage {
    public let id: String
    public let author: String
    public let width: Int
    public let height: Int
    
    public init(
        id: String,
        author: String,
        width: Int,
        height: Int
    ) {
        self.id = id
        self.author = author
        self.width = width
        self.height = height
    }
}

