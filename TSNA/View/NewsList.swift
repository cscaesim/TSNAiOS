//
//  NewsList.swift
//  TSNA
//
//  Created by Caine Simpson on 6/18/21.
//

import SwiftUI

enum ResultState: Equatable {
    static func == (lhs: ResultState, rhs: ResultState) -> Bool {
        switch(lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.failed(error: let lhsType), .failed(error: let rhsType)):
            return lhsType.localizedDescription == rhsType.localizedDescription
        case (.success(content: let lhsType), .success(content: let rhsType)):
            return lhsType == rhsType
        default:
            return false
        }
    }
    
    case loading
    case failed(error: Error)
    case success(content: [Article])
}

struct NewsList: View {
    
    @State var isLoading: Bool
    var articles: [Article]?
    var blogs: [Article]?
    var reports: [Article]?
    
    var body: some View {
        if articles != nil {
            List {
                ForEach(articles!, id: \.self) { item in
                    NavigationLink(destination: DetailView(title: item.title, summary: item.summary, image: item.imageUrl, url: item.url, site: item.newsSite, publishedTime: item.publishedAt)) {
                        ListRow(image: item.imageUrl, title: item.title, site: item.newsSite)
                    }.buttonStyle(DefaultButtonStyle())
                }
            }
        } else if blogs != nil {
            List {
                ForEach(blogs!, id: \.self) { item in
                    NavigationLink(destination: DetailView(title: item.title, summary: item.summary, image: item.imageUrl, url: item.url, site: item.newsSite, publishedTime: item.publishedAt)) {
                        ListRow(image: item.imageUrl, title: item.title, site: item.newsSite)
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        } else if reports != nil {
            List {
                ForEach(reports!, id: \.self) { item in
                    NavigationLink(destination: DetailView(title: item.title, summary: item.summary, image: item.imageUrl, url: item.url, site: item.newsSite, publishedTime: item.publishedAt)) {
                        ListRow(image: item.imageUrl, title: item.title, site: item.newsSite)
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}
