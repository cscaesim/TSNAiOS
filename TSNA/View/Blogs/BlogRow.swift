//
//  BlogRow.swift
//  TSNA
//
//  Created by Caine Simpson on 6/18/21.
//

import SwiftUI

struct ReportsCell: View {
    var report: Blog
    
    var body: some View {
        VStack(alignment: .leading) {
            URLImage(report.imageUrl).frame(width: 120, height: 120)
                .cornerRadius(5)
            Text(report.title)
                .font(.caption)
                .frame(width: 155)
        }
        .padding(.leading)
    }
}

struct BlogRow: View {
    var blogs: [Blog]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Blogs")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(blogs, id: \.self) { blog in
                        NavigationLink(
                            destination: DetailView(title: blog.title, summary: blog.summary, image: blog.imageUrl, url: blog.url, site: blog.newsSite, publishedTime: blog.publishedAt),
                            label: {
                                ReportsCell(report: blog)
                            })
                            .buttonStyle(PlainButtonStyle())
                    }
                }
            })
           
        }
    }

}
