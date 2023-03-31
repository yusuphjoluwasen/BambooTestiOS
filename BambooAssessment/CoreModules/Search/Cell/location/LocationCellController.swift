//
//  LocationCellController.swift
//  BambooAssessment
//
//  Created by Guru King on 31/03/2023.
//

import RxSwift
import RxCocoa

final class LocationCellController:CellController{
    var headerTitle: String = "SEARCH A LOCATION"
    var disposeBag = DisposeBag()
    
    var model: [CellModel] = [CellModel(title: "Latitude", output: ""), CellModel(title: "Longitude", output: "")]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StringConstants.locationCellId, for: indexPath) as! LocationCell
        let data = model[indexPath.item]
        cell.populate(data)
        cell.textField.rx.controlEvent([.editingChanged])
                .asObservable().subscribe({ [unowned self] _ in
                    model[indexPath.item].output = cell.textField.text.toString
                }).disposed(by: disposeBag)
        return cell
    }
}
