//
//  HomeViewController.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import UIKit
import RxSwift
import Action

class HolidaysViewController: UIViewController, BindableType {
    var viewModel: HolidaysViewModel!


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
        fetch.execute()
    }
    
    deinit {
        print("Deinit")
    }

    // MARK: BindableType

    func bindViewModel() {
        tableView.rx.modelSelected(String.self)
            .bind(to: viewModel.input.selectHoliday)
            .disposed(by: disposeBag)
        
        viewModel.output.holidays
            .bind(to: tableView.rx.items(cellIdentifier: tableViewCellIdentifier)) { _, model, cell in
                cell.textLabel?.text = model
//                cell.detailTextLabel?.text = model.subtitle
//                cell.imageView?.image = model.image
//                cell.selectionStyle = .none
            }
            .disposed(by: disposeBag)
    }
    
    // MARK: Actions
    
    lazy var fetch = CocoaAction { [unowned self] in
        self.viewModel.input.fetchHolidaysTrigger.onNext(())
        return .empty()
    }

}

