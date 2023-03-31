//
//  CellController.swift
//  BambooAssessment
//
//  Created by Guru King on 31/03/2023.
//

import UIKit

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
