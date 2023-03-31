//
//  SearchCityCellController.swift
//  BambooAssessment
//
//  Created by Guru King on 31/03/2023.
//

import Foundation
import RxSwift
import RxCocoa

final class SearchCityCellController:CellController{
    var heightForRow: CGFloat = 50
    var disposeBag = DisposeBag()
    var onsubmitbuttonclick:(() -> ())?
    
    var headerTitle: String = "SEARCH A CITY"
    
    var model: [CellModel] = [CellModel(title: "City name", output: "")]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StringConstants.searchCityCellId, for: indexPath) as! SearchCityCell
        let data = model[indexPath.item]
        cell.separatorInset = UIEdgeInsets(top: 0, left: CGFloat.greatestFiniteMagnitude, bottom: 0, right: 0);
        cell.populate(data)
        cell.textField.rx.controlEvent([.editingChanged])
                .asObservable().subscribe({ [unowned self] _ in
                    model[indexPath.item].output = cell.textField.text.toString
                }).disposed(by: disposeBag)
        return cell
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: StringConstants.footerCellId ) as! SearchCityFooterView
        headerView.onbtnClick = { [weak self] in
            self?.onsubmitbuttonclick!()
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
       return 50
    }
}
