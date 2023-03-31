//
//  SearchDetailView.swift
//  BambooAssessment
//
//  Created by Guru King on 30/03/2023.
//

import Foundation
import UIKit

final class WeatherSearchDetailView : UIView {
    
    
    lazy var segmentControl:UISegmentedControl = {
        let this = UISegmentedControl(items: ["C","F"])
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font:UIFont.systemFont12Medium]
        this.setTitleTextAttributes(titleTextAttributes, for: .normal)
        this.selectedSegmentIndex = 0
        this.tintColor = .systemGray2
        this.translatesAutoresizingMaskIntoConstraints = false
        this.selectedSegmentTintColor = .white
        return this
    }()
    
    
    lazy var weatherImg : UIImageView = {
        let this = UIImageView()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.image = UIImage(named: "sun")
        return this
    }()
    
    lazy var weatherCondLabel: UILabel = {
        let this = UILabel()
        this.setUpGenLabel(text: "sunny", textColor: .black, font: .systemFont16Regular,
                           numberOfLines: 1)
        return this
    }()
    
    lazy var tempLabel: UILabel = {
        let this = UILabel()
        this.setUpGenLabel(text: "34 °C", textColor: .black, font: .systemFont36Bold,
                           numberOfLines: 1)
        return this
    }()
    
    lazy var detailLabel: UILabel = {
        let this = UILabel()
        this.setUpGenLabel(text: "DETAILS", textColor: .black, font: .systemFont12Medium,
                           numberOfLines: 1)
        return this
    }()
    
    lazy var tableView:UITableView = {
        let this = UITableView()
        this.backgroundColor = .white
        this.showsVerticalScrollIndicator = false
        this.isScrollEnabled = false
        this.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        this.translatesAutoresizingMaskIntoConstraints = false
        this.register(SearchDetailCell.self, forCellReuseIdentifier: StringConstants.searchDetailCellId)
        return this
    }()
    
    convenience init() {
        self.init(frame: .zero)
        configureView()
        configureConstraints()
    }
    
    private func configureView() {
        backgroundColor = .white
        addSubview(segmentControl)
        addSubview(weatherImg)
        addSubview(weatherCondLabel)
        addSubview(tempLabel)
        addSubview(detailLabel)
        addSubview(tableView)
    }
}

extension WeatherSearchDetailView{
    func configureConstraints() {
            NSLayoutConstraint.activate([
                segmentControl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -CGFloat.size40),
                segmentControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat.size20),
                segmentControl.widthAnchor.constraint(equalToConstant: 100),
                
                weatherImg.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: CGFloat.size20),
                weatherImg.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                weatherCondLabel.topAnchor.constraint(equalTo: weatherImg.bottomAnchor, constant: CGFloat.size5),
                weatherCondLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                tempLabel.topAnchor.constraint(equalTo: weatherCondLabel.bottomAnchor, constant: CGFloat.size5),
                tempLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                
                detailLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: CGFloat.size20),
                detailLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: CGFloat.size20),
                
                tableView.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: CGFloat.size20),
                tableView.leftAnchor.constraint(equalTo: detailLabel.leftAnchor),
                tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat.size20),
                tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ])
        }
}


