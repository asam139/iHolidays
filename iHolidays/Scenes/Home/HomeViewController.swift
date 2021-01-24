//
//  HomeViewController.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController, BindableType {
    var viewModel: HomeViewModel!


    // MARK: Views

    @IBOutlet private var tableView: UITableView!

    // MARK: Stored properties

    private let disposeBag = DisposeBag()
    private let tableViewCellIdentifier = String(describing: DetailTableViewCell.self)

    // MARK: Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: tableViewCellIdentifier)
        tableView.rowHeight = 44
    }

    // MARK: BindableType

    func bindViewModel() {
        //viewModel.input.action.onNext(.viewDidLoad)
        
        viewModel.output.holidays
            .bind(to: tableView.rx.items(cellIdentifier: tableViewCellIdentifier)) { _, model, cell in
                cell.textLabel?.text = model
//                cell.detailTextLabel?.text = model.subtitle
//                cell.imageView?.image = model.image
//                cell.selectionStyle = .none
            }
            .disposed(by: disposeBag)
    }
}

