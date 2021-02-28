//
//  ViewModelType.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 26/1/21.
//

protocol ViewModelType {
    associatedtype Input
    associatedtype Output

    var input: Input { get }
    var output: Output { get }
}
