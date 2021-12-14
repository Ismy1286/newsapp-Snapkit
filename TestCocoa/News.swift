//
//  News.swift
//  TestCocoa
//
//  Created by user on 14.12.2021.
//

import Foundation

class News: Codable {
    var article: [Articles] = []
    enum CodingKeys: String, CodingKey {
        case article = "articles"
    }
}

class Articles: Codable {
    var title: String? = nil
    var description: String? = nil
        
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "description"
    }
}
