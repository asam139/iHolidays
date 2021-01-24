//
//  HomeViewModelImpl.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import Foundation
import RxSwift
import Action
import XCoordinator

class HomeViewModelImpl: HomeViewModel, TransformableType {
    let disposeBag = DisposeBag()

    // MARK: Inputs
    private lazy var action = PublishSubject<HomeViewModelAction>()
    
    lazy var input: HomeViewModelInput = {
        let input = HomeViewModelInput(action: action.asObserver())
        return input
    }()
    
    // MARK: Outputs
    private lazy var holidaysSub = PublishSubject<[String]>()
    
    lazy var output: HomeViewModelOutput = {
        transform(input: input)
    }()
    
    // MARK: Transform
    func transform(input: HomeViewModelInput) -> HomeViewModelOutput {
        
        action.filter { $0 == .viewDidLoad }
            .map { _ in ["1", "2", "3"]}
            .bind(to: holidaysSub)
            .disposed(by: disposeBag)
        
        return HomeViewModelOutput(holidays: holidaysSub.asObservable())
    }

    // MARK: Stored properties

//    private let router: UnownedRouter<AboutRoute>

    // MARK: Initialization

//    init(router: UnownedRouter<AboutRoute>) {
//        self.router = router
//    }

}
