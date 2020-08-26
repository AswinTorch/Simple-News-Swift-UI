//
//  NewsData.swift
//  Torch News
//
//  Created by Aswin Nair on 8/25/20.
//

import Foundation

struct Results: Decodable {
    let articles: [Article]
}

struct Article: Decodable, Identifiable {
    // Just using url as id as it is unique
    var id: String {
        return title
    }
    
    let author: String?
    let title: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}
