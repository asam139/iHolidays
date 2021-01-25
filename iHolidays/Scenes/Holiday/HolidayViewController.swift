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
    @IBOutlet private var button: UIButton!

    // MARK: Stored properties

    private let disposeBag = DisposeBag()

    // MARK: Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    deinit {
        print("Deinit")
    }

    // MARK: BindableType

    func bindViewModel() {
        button.rx.action = onDone
        viewModel.output.holiday.bind(to: label.rx.text).disposed(by: disposeBag)
    }
    
    // MARK: Actions
    
    private lazy var onDone = CocoaAction { [unowned self] in
        self.viewModel.input.dismissTrigger.onNext(())
        return .empty()
    }
}
