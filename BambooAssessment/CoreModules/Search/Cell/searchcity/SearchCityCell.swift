//
//  SearchCityCell.swift
//  BambooAssessment
//
//  Created by Guru King on 30/03/2023.
//

import UIKit

final class SearchCityCell: UITableViewCell {
    
    lazy var textField:UITextField = {
        let this = UITextField()
        let props = TextFieldProps(placeholderString: StringConstants.latitude)
        this.setUpNormalTextField(props)
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

extension SearchCityCell{
    
    private func configureView(){
        separatorInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        contentView.isUserInteractionEnabled = false
    }

    private func configureSubviews() {
        addSubview(textField)
    }
    
    func configureConstraints() {
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.size20),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat.size20),
            textField.heightAnchor.constraint(equalToConstant: CGFloat.size45)
        ])
    }
    
    func populate(_ data: CellModel) {
        textField.placeholder = data.title
    }
}
