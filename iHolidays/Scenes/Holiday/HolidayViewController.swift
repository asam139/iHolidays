//
//  HolidayViewController.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import UIKit
import RxSwift
import RxCocoa

class HolidayViewController: UIViewController, BindableType {
    var viewModel: HolidayViewModel!

    // MARK: Views
    @IBOutlet private var label: UILabel!
    @IBOutlet private var button: UIButton!

    // MARK: Stored properties

    private let disposeBag = DisposeBag()

    // MARK: Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    deinit {
        print("Deinit \(self)")
    }

    // MARK: BindableType

    func bindViewModel() {
        button.rx.tap.subscribe(onNext: { [unowned self] in
            self.viewModel.input.dismissTrigger.onNext(())
        }).disposed(by: disposeBag)
        viewModel.output.holiday.map { $0.name }
            .asDriver(onErrorJustReturn: "")
            .drive(label.rx.text).disposed(by: disposeBag)
    }
}
