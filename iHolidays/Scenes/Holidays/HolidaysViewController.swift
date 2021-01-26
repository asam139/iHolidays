//
//  HomeViewController.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import UIKit
import RxSwift
import iHolidaysDomain

class HolidaysViewController: BindableViewController<HolidaysViewModel> {
    // MARK: Views
    @IBOutlet private var tableView: UITableView!

    // MARK: Stored properties

    private let disposeBag = DisposeBag()
    private let tableViewCellIdentifier = String(describing: HolidayTableViewCell.self)

    // MARK: Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(HolidayTableViewCell.self, forCellReuseIdentifier: tableViewCellIdentifier)
        tableView.rowHeight = 44
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fecth()
    }
    
    deinit {
        print("Deinit \(self)")
    }

    // MARK: BindableType

    override func bindViewModel() {
        super.bindViewModel()
        
        tableView.rx.modelSelected(Holiday.self)
            .asDriver()
            .drive(viewModel.input.selectHoliday)
            .disposed(by: disposeBag)
        
        viewModel.output.holidays
            .asDriver(onErrorJustReturn: [])
            .drive(tableView.rx.items(cellIdentifier: tableViewCellIdentifier)) { _, model, cell in
                cell.textLabel?.text = model.name
//                cell.detailTextLabel?.text = model.subtitle
//                cell.imageView?.image = model.image
//                cell.selectionStyle = .none
            }
            .disposed(by: disposeBag)
    }
    
    private func fecth() {
        viewModel.input.fetchHolidaysTrigger.onNext(())
    }
}

