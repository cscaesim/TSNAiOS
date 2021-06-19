//
//  Article.swift
//  TSNA
//
//  Created by Caine Simpson on 6/17/21.
//

import Foundation
struct Article: Codable, Hashable {
//    var events: [String]
//    var featured: Bool
    var id: Int
    var imageUrl: String
//    var launches: [Dictionary<String, String>]
    var newsSite: String
    var publishedAt: String
    var summary: String
    var title: String
    var updatedAt: String
    var url: String
}
