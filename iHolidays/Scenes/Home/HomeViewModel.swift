//
//  HomeViewModel.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import RxSwift
import RxRelay

enum HomeViewModelAction {
    case viewDidLoad
}

struct HomeViewModelInput {
    var action: AnyObserver<HomeViewModelAction>
}

struct HomeViewModelOutput {
    let holidays: Observable<[String]>
}

protocol HomeViewModel {
    var input: HomeViewModelInput { get }
    var output: HomeViewModelOutput { get }
}
