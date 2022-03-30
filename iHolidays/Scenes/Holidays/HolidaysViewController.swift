//
//  HomeViewController.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import iHolidaysDomain
import RxSwift
import SDWebImage
import UIKit

class HolidaysViewController: BindableViewController<HolidaysViewModel> {
    // MARK: Stored properties
    private let tableView: UITableView = {
        UITableView()
    }()

    // MARK: Stored properties
    private let tableViewCellIdentifier = String(describing: HolidayTableViewCell.self)

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(HolidayTableViewCell.self, forCellReuseIdentifier: tableViewCellIdentifier)
        tableView.rowHeight = 44
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetch()
    }

    deinit {
        print("Deinit \(self)")
    }

    // MARK: BindableType

    override func setUp() {
        super.setUp()
        view.addSubviewFully(tableView)
    }

    override func bindViewModel() {
        super.bindViewModel()

        tableView.rx.modelSelected(HolidayWithImage.self)
            .asDriver()
            .map { $0.holiday }
            .drive(viewModel.input.selectHoliday)
            .disposed(by: disposeBag)

        viewModel.output.holidays
            .asDriver(onErrorJustReturn: [])
            .drive(tableView.rx.items(cellIdentifier: tableViewCellIdentifier)) { _, model, cell in
                guard let cell = cell as? HolidayTableViewCell else {
                    return
                }
                cell.update(model: .init(imageURL: model.imageURL, name: model.holiday.name))
            }
            .disposed(by: disposeBag)
    }

    private func fetch() {
        viewModel.input.fetchHolidaysTrigger.onNext(())
    }
}
