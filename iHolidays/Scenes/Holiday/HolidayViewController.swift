//
//  HolidayViewController.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import RxCocoa
import RxSwift
import UIKit

class HolidayViewController: BindableViewController<HolidayViewModel> {
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = .label
        return label
    }()

    private var okButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        button.setTitle("Done", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func setUp() {
        super.setUp()
        view.addSubviews(nameLabel, okButton)

        nameLabel.center()
        okButton.alignX()
        okButton.anchor(
            top: nameLabel.bottomAnchor,
            padding: .init(bottom: 24)
        )
    }

    override func bindViewModel() {
        viewModel.output.holiday.map { $0.name }
            .asDriver(onErrorJustReturn: "")
            .drive(nameLabel.rx.text).disposed(by: disposeBag)

        okButton.rx.tap.subscribe(onNext: { [viewModel] in
            viewModel?.input.dismissTrigger.onNext(())
        }).disposed(by: disposeBag)
    }
}
