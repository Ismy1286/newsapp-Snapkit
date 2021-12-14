//
//  NewsCell.swift
//  TestCocoa
//
//  Created by user on 14.12.2021.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class NewsCell: UITableViewCell {
    
    private lazy var newsImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    private lazy var titleNews: UILabel = {
        let view = UILabel()
//        view.textColor = .white
        view.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return view
    }()
    
    private lazy var subTitleNews: UILabel = {
        let view = UILabel()

        view.numberOfLines = 0
        view.font = UIFont.systemFont(ofSize: 12)
        return view
    }()
    
    private lazy var lineNews: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray
        
        return view


    }()
    
    override func layoutSubviews() {
        addSubview(newsImage)
        newsImage.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(8)
            make.width.equalTo(114)
            make.height.equalTo(114)

        }
        
        addSubview(titleNews)
        titleNews.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalTo(newsImage.snp.left).offset(-8)
        }
        
        addSubview(subTitleNews)
        subTitleNews.snp.makeConstraints { make in
            make.top.equalTo(titleNews.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalTo(newsImage.snp.left).offset(-8)
        }
        
        addSubview(lineNews)
        lineNews.snp.makeConstraints { make in
            make.top.equalTo(newsImage.snp.bottom).offset(6)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
            make.width.equalTo(2)
        }
    }
    
    func fill(model: Articles) {
        titleNews.text = model.title
        subTitleNews.text = model.description
        newsImage.kf.setImage(with: URL(string: model.urlToImage ?? String()))
    }
}
