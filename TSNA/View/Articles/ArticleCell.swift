//
//  CategoryCell.swift
//  TSNA
//
//  Created by Caine Simpson on 6/17/21.
//

import SwiftUI

struct ArticleCell: View {
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            URLImage(article.imageUrl).frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(article.title)
                .font(.caption)
                .frame(width: 155)
        }
        .padding(.leading)
    }
}

//struct CategoryCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryCell()
//    }
//}
