//
//  HolidaysViewModelImpl.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import Foundation
import RxSwift
import Action
import XCoordinator

class HolidaysViewModelImpl: HolidaysViewModel, TransformableType {
    let disposeBag = DisposeBag()

    // MARK: Inputs
    private lazy var action = PublishSubject<HolidaysViewModelAction>()
    
    lazy var input: HolidaysViewModelInput = {
        let input = HolidaysViewModelInput(action: action.asObserver())
        return input
    }()
    
    // MARK: Outputs
    private lazy var holidaysSub = PublishSubject<[String]>()
    
    lazy var output: HolidaysViewModelOutput = {
        transform(input: input)
    }()
    
    // MARK: Transform
    func transform(input: HolidaysViewModelInput) -> HolidaysViewModelOutput {
        
        action.filter { $0 == .fetch }
            .map { _ in ["1", "2", "3"]}
            .bind(to: holidaysSub)
            .disposed(by: disposeBag)
        
        return HolidaysViewModelOutput(holidays: holidaysSub.asObservable())
    }

    // MARK: Stored properties

    private let router: UnownedRouter<HolidaysRoute>

    // MARK: Initialization

    init(router: UnownedRouter<HolidaysRoute>) {
        self.router = router
    }

}
