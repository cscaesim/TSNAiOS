//
//  ArticleRow.swift
//  TSNA
//
//  Created by Caine Simpson on 6/17/21.
//

import SwiftUI

struct ArticleRow: View {
    var articles: [Article]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Articles")
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

struct ArticleRow_Previews: PreviewProvider {
    static var previews: some View {
        ArticleRow(articles: [Article(events: [], featured: false, id: 1, imageUrl: "", launches: [], newsSite: "cnn.com", publishedAt: "2017-08-1", summary: "The monsters are out to get us", title: "Monsters are coming", updatedAt: "", url: "")])
    }
}
