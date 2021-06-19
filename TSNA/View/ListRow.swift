//
//  ListRow.swift
//  TSNA
//
//  Created by Caine Simpson on 6/18/21.
//

import SwiftUI

struct ListRow: View {
    var image: String
    var title: String
    var site: String
    
    var body: some View {
        HStack {
            URLImage(image)
                .frame(width: 50, height: 50)
            Text(title)
        }
    }
}
