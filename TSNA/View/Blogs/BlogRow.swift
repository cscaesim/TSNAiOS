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
            URLImage(report.imageUrl).frame(width: 155, height: 155)
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
                        ReportsCell(report: blog)
                    }
                }
            })
           
        }
    }

}
