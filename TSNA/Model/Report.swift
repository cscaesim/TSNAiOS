//
//  Report.swift
//  TSNA
//
//  Created by Caine Simpson on 6/18/21.
//

import Foundation

struct Report: Codable, Hashable {
    var id: Int
    var title: String
    var url: String
    var imageUrl: String
    var newsSite: String
    var summary: String
    var publishedAt: String
}
