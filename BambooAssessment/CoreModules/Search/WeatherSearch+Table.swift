//
//  WeatherSearch+Table.swift
//  BambooAssessment
//
//  Created by Guru King on 30/03/2023.
//

import UIKit

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

