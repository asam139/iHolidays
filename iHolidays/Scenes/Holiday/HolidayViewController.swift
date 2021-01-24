//
//  HolidayViewController.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import UIKit
import RxSwift
import Action

class HolidayViewController: UIViewController, BindableType {
    var viewModel: HolidayViewModel!

    // MARK: Views
    @IBOutlet private var label: UILabel!

    // MARK: Stored properties

    private let disposeBag = DisposeBag()

    // MARK: Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // MARK: BindableType

    func bindViewModel() {
        //viewModel.input.action.onNext(.viewDidLoad)
        
        viewModel.output.holiday.bind(to: label.rx.text).disposed(by: disposeBag)

    }
}
