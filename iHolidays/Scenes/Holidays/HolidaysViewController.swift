//
//  HomeViewController.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import UIKit
import RxSwift
import SDWebImage
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
                cell.randomImageView.sd_setImage(with: model.imageURL, placeholderImage: nil, options: [.refreshCached])
                cell.nameLabel.text = model.holiday.name
            }
            .disposed(by: disposeBag)
    }
    
    private func fecth() {
        viewModel.input.fetchHolidaysTrigger.onNext(())
    }
}

