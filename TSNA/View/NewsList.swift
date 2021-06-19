//
//  NewsList.swift
//  TSNA
//
//  Created by Caine Simpson on 6/18/21.
//

import SwiftUI

struct NewsList: View {
    
    var articles: [Article]?
    var blogs: [Blog]?
    var reports: [Report]?
    
    var body: some View {
        if articles != nil {
            List {
                ForEach(articles!, id: \.self) { item in
                    NavigationLink(destination: DetailView(title: item.title, summary: item.summary, image: item.imageUrl, url: item.url, site: item.newsSite, publishedTime: item.publishedAt)) {
                        ListRow(image: item.imageUrl, title: item.title, site: item.newsSite)
                    }.buttonStyle(PlainButtonStyle())
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
