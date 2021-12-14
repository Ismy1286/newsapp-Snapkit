//
//  NewsCell.swift
//  TestCocoa
//
//  Created by user on 14.12.2021.
//

import Foundation
import UIKit
import SnapKit

class NewsCell: UITableViewCell {
    
    private lazy var titleNews: UILabel = {
        let view = UILabel()
        return view
    }()
    
    private lazy var subTitleNews: UILabel = {
        let view = UILabel()
        return view
    }()
    
    override func layoutSubviews() {
        addSubview(titleNews)
        titleNews.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        addSubview(subTitleNews)
        subTitleNews.snp.makeConstraints { make in
            make.top.equalTo(titleNews.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }
    
    func fill(model: Articles) {
        titleNews.text = model.title
        subTitleNews.text = model.description
    }
}
