//
//  ArticleRow.swift
//  TSNA
//
//  Created by Caine Simpson on 6/17/21.
//

import SwiftUI

struct ArticleRow: View {
    var articles: [Article]
    var title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(title)")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(articles, id: \.self) { article in
                        NavigationLink(
                            destination: DetailView(title: article.title,
                                                    summary: article.summary,
                                                    image: article.imageUrl,
                                                    url: article.url,
                                                    site: article.newsSite,
                                                    publishedTime: article.publishedAt),
                            label: {
                                ArticleCell(article: article)
                            }).buttonStyle(PlainButtonStyle())
                    }
                }
            })
        }
    }
}
