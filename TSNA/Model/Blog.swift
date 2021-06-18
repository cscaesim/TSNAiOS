//
//  Blog.swift
//  TSNA
//
//  Created by Caine Simpson on 6/17/21.
//

import Foundation

struct Blog: Codable, Hashable {
    var id: Int
    var title: String
    var url: String
    var imageUrl: String
    var newsSite: String
    var summary: String
    var publishedAt: String
    var launches: [Dictionary<String, String>]
}
