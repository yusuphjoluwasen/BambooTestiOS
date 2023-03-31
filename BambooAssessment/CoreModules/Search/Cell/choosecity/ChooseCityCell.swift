//
//  SearchCell.swift
//  BambooAssessment
//
//  Created by Guru King on 30/03/2023.
//

import UIKit

final class ChooseCityCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let this = UILabel()
        this.setUpGenLabel(text: "", textColor: .tertiaryColor, font: .systemFont14Bold,
                           numberOfLines: 3)
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

extension ChooseCityCell{
    
    private func configureView(){
        accessoryType = .disclosureIndicator
    }
    
    private func configureSubviews() {
        addSubview(titleLabel)
    }
    
    func configureConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat.size15),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.size20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat.size20)
        ])
    }
    
    func populate(_ data: CellModel) {
        titleLabel.text = data.title
    }
}

