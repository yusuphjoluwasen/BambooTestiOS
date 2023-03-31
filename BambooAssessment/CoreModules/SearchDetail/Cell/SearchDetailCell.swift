//
//  SearchDetailCell.swift
//  BambooAssessment
//
//  Created by Guru King on 31/03/2023.
//

import UIKit

final class SearchDetailCell: UITableViewCell {
    
    let label: UILabel = {
        let this = UILabel()
        this.setUpGenLabel(text: "", textColor: .textColor, font: .systemFont16Regular)
        return this
    }()
    
    let value: UILabel = {
        let this = UILabel()
        this.setUpGenLabel(text: "", textColor: .textColor, font: .systemFont16Regular)
        return this
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
        configureSubviews()
        configureConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension SearchDetailCell{
    
    private func configureView(){
        selectionStyle = .none
    }
    
    private func configureSubviews() {
        addSubview(label)
        addSubview(value)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            value.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            value.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func populate(_ data: WeatherData) {
        label.text = data.title
        value.text = data.value
    }
}

