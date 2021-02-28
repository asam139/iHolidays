//
//  BaseTargetType.swift
//
//
//  Created by Saúl Moreno Abril on 2/2/21.
//

import Foundation
import Moya

public protocol BaseTargetType: TargetType {
    associatedtype T

    var mainBaseURL: URL { get }
    var action: T { get }
}
