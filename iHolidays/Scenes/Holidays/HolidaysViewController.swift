//
//  HomeViewController.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 24/1/21.
//

import iHolidaysDomain
import RxDataSources
import RxSwift
import SDWebImage
import UIKit

class HolidaysViewController: BindableViewController<HolidaysViewModel> {
    // MARK: Stored properties
    private let tableView: UITableView = {
        UITableView()
    }()

    // MARK: Stored properties
    private static let tableViewCellIdentifier = String(describing: HolidayTableViewCell.self)

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(HolidayTableViewCell.self, forCellReuseIdentifier: Self.tableViewCellIdentifier)
        tableView.rowHeight = 44
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetch()
    }

    // MARK: BindableType

    override func setUp() {
        super.setUp()
        view.addSubviewFully(tableView)
    }

    override func bindViewModel() {
        super.bindViewModel()

        tableView.rx.modelSelected(HolidaysViewModel.HolidayWithImage.self)
            .asDriver()
            .map { $0.holiday }
            .drive(viewModel.input.selectHoliday)
            .disposed(by: disposeBag)

        let dataSource = RxTableViewSectionedReloadDataSource<HolidaysViewModel.Section> {
            _, tableView, indexPath, item  in
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Self.tableViewCellIdentifier,
                for: indexPath
            ) as? HolidayTableViewCell else {
                return UITableViewCell()
            }
            cell.update(model: .init(imageURL: item.imageURL, name: item.holiday.name))
            return cell
        }

        viewModel.output.sections
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }

    private func fetch() {
        viewModel.input.fetchHolidaysTrigger.onNext(())
    }
}
