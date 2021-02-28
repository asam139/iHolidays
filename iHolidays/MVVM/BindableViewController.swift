//
//  BindableViewController.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 26/1/21.
//

import UIKit
import RxSwift

class BindableViewController<ViewModel>: UIViewController, BindableType {
    var viewModel: ViewModel!
    let disposeBag = DisposeBag()
    
    func bindViewModel() {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
}

