//
//  PicsumImageFake.swift
//  iHolidaysDomain
//
//  Created by Saúl Moreno Abril on 28/2/21.
//

import iHolidaysDomain

enum PicsumImageFake {
    static let id = "0"
    static let author = "author"
    static let width = 100
    static let height = 100

    static let instance = PicsumImage(
        id: id,
        author: author,
        width: width,
        height: height
    )
}
