//
//  SearchCityFooter.swift
//  BambooAssessment
//
//  Created by Guru King on 31/03/2023.
//

import UIKit
import RxSwift
import RxCocoa

final class SearchCityFooterView: UITableViewHeaderFooterView {
    let disposeBag = DisposeBag()
    var onbtnClick: (() -> ())?
    
    lazy var btn:UIButton = {
        let this = UIButton(type: .system)
        this.setUpButton(text: "Search")
        return this
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureView()
        configureSubviews()
        configureConstraints()
        btnClick()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension SearchCityFooterView{
    
    private func configureView(){
        
    }

    private func configureSubviews() {
        addSubview(btn)
    }
    
    func configureConstraints() {
        
        NSLayoutConstraint.activate([
            btn.topAnchor.constraint(equalTo: topAnchor, constant: .size20),
            btn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat.size20),
            btn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -CGFloat.size20),
            btn.heightAnchor.constraint(equalToConstant: CGFloat.size45)
        ])
    }
    
    
    func btnClick(){
        btn.rx.tap.bind{ [weak self] in
            self?.onbtnClick!()
        }
        .disposed(by: disposeBag)
    }
}
