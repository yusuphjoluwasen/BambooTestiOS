//
//  WeatherSearchView.swift
//  BambooAssessment
//
//  Created by Guru King on 30/03/2023.
//

import UIKit

final class WeatherSearchView : UIView {
    
    lazy var tableView:UITableView = {
        let this = UITableView()
        this.backgroundColor = .lightGray
        this.showsVerticalScrollIndicator = false
        this.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        this.translatesAutoresizingMaskIntoConstraints = false
        this.register(ChooseCityCell.self, forCellReuseIdentifier: StringConstants.chooseCityCellId)
        this.register(LocationCell.self, forCellReuseIdentifier: StringConstants.locationCellId)
        this.register(SearchCityCell.self, forCellReuseIdentifier: StringConstants.searchCityCellId)
        this.register(SearchCityFooterView.self, forHeaderFooterViewReuseIdentifier: StringConstants.footerCellId)
        return this
    }()
    
    convenience init() {
        self.init(frame: .zero)
        configureView()
        configureConstraints()
    }
    
    private func configureView() {
        backgroundColor = .white
        addSubview(tableView)
    }
}

extension WeatherSearchView{
    func configureConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

