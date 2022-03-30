//
//  BindableViewController.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 26/1/21.
//

import RxSwift
import UIKit

class BindableViewController<ViewModel>: UIViewController, BindableType {
    var viewModel: ViewModel!
    let disposeBag = DisposeBag()

    func setUp() {}
    func bindViewModel() {}

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        bindViewModel()
    }
}
