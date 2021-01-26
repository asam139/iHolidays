//
//  BindableViewController.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 26/1/21.
//

import UIKit

class BindableViewController<ViewModel>: UIViewController, BindableType {
    var viewModel: ViewModel!
    
    func bindViewModel() {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
}

