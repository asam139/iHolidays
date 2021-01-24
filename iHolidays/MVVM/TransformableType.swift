//
//  TransformableType.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

protocol TransformableType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
