//
//  SearchDetail+Table.swift
//  BambooAssessment
//
//  Created by Guru King on 31/03/2023.
//

import UIKit

extension SearchDetailViewController:UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherTableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StringConstants.searchDetailCellId, for: indexPath) as! SearchDetailCell
        let data = weatherTableData[indexPath.item]
        cell.populate(data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}
