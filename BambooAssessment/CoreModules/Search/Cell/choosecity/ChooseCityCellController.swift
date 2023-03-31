//
//  ChooseCityCellController.swift
//  BambooAssessment
//
//  Created by Guru King on 31/03/2023.
//

import UIKit

final class ChooseCityCellController:CellController{
    var headerTitle: String = "CHOOSE A CITY"
    var onselectprepopulated:((String)->())?
    
    var model: [CellModel] = [CellModel(title: "Delhi", output: ""), CellModel(title: "Berlin", output: ""), CellModel(title: "Toronto", output: "")]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StringConstants.chooseCityCellId, for: indexPath) as! ChooseCityCell
        let data = model[indexPath.item]
        cell.populate(data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let data = model[indexPath.item]
        onselectprepopulated!(data.title)
    }
}
