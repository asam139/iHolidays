//
//  ViewModelType.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 26/1/21.
//

protocol ViewModelType {
    associatedtype In
    associatedtype Out

    var input: In { get }
    var output: Out { get }
}
