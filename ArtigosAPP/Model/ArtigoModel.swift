//
//  ArtigoModel.swift
//  ArtigosAPP
//
//  Created by Ezequias Santos on 30/11/22.
//

import Foundation

// MARK: - Welcome
struct ArtigoModelResponse: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
 
    let author, title, articleDescription: String?

    enum CodingKeys: String, CodingKey {
        case author, title
        case articleDescription = "description"
        
    }
}
