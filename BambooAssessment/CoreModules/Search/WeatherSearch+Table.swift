//
//  WeatherSearch+Table.swift
//  BambooAssessment
//
//  Created by Guru King on 30/03/2023.
//

import UIKit
import RxSwift
import RxCocoa

struct CellModel{
    var title:String
    var output:String
}

protocol CellController{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    var model: [CellModel] {get set}
    var headerTitle: String {get set}
}

extension CellController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return model.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        return headerTitle
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?{
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){}
}

class ChooseCityCellController:CellController{
    var headerTitle: String = "CHOOSE A CITY"
    var action:((String)->())?
    
    var model: [CellModel] = [CellModel(title: "Delhi", output: ""), CellModel(title: "Berlin", output: ""), CellModel(title: "Toronto", output: "")]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StringConstants.chooseCityCellId, for: indexPath) as! ChooseCityCell
        let data = model[indexPath.item]
        cell.populate(data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let data = model[indexPath.item]
        print("hahshshs")
        action!(data.title)
    }
}

class LocationCellController:CellController{
    var headerTitle: String = "SEARCH A LOCATION"
    var disposeBag = DisposeBag()
    
    var model: [CellModel] = [CellModel(title: "Latitude", output: ""), CellModel(title: "Longitude", output: "")]
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StringConstants.locationCellId, for: indexPath) as! LocationCell
        let data = model[indexPath.item]
        cell.populate(data)
        cell.textField.rx.controlEvent([.editingChanged])
                .asObservable().subscribe({ [unowned self] _ in
                    model[indexPath.item].output = cell.textField.text ?? ""
                }).disposed(by: disposeBag)
        return cell
    }
}

class SearchCityCellController:CellController{
    var heightForRow: CGFloat = 50
    var disposeBag = DisposeBag()
    var action:(() -> ())?
    
    var headerTitle: String = "SEARCH A CITY"
    
    var model: [CellModel] = [CellModel(title: "City name", output: "")]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StringConstants.searchCityCellId, for: indexPath) as! SearchCityCell
        let data = model[indexPath.item]
        cell.separatorInset = UIEdgeInsets(top: 0, left: CGFloat.greatestFiniteMagnitude, bottom: 0, right: 0);
        cell.populate(data)
        cell.textField.rx.controlEvent([.editingChanged])
                .asObservable().subscribe({ [unowned self] _ in
                    model[indexPath.item].output = cell.textField.text ?? ""
                }).disposed(by: disposeBag)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?{
        let footerView = UIView()
        footerView.frame = CGRect(x: 0, y: 0, width: 350, height:
                                    100)
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 10, width: 300, height: 50)
        button.setTitle("CustomButton", for: .normal)
        button.setTitleColor(.yellow, for: .normal)
        button.backgroundColor = .blue
        footerView.addSubview(button)
        
        button.rx.tap.bind{ [weak self] in
            self?.action!()
        }
        .disposed(by: disposeBag)
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
       return 50
    }
}

extension WeatherSearchViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells[section].model.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let controller = cells[indexPath.section]
        return controller.tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let controller = cells[section]
        return controller.tableView(tableView, titleForHeaderInSection: section)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        headerView.tintColor = .yellow
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let controller = cells[section]
        return controller.tableView(tableView, viewForFooterInSection: section)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let controller = cells[section]
        return controller.tableView(tableView, heightForFooterInSection: section)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = cells[indexPath.section]
        controller.tableView(tableView, didSelectRowAt: indexPath)
    }
}

