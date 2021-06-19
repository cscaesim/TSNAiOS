//
//  DetailView.swift
//  TSNA
//
//  Created by Caine Simpson on 6/18/21.
//

import SwiftUI

struct DetailView: View {
    var title: String
    var summary: String
    var image: String
    var url: String
    var site: String
    var publishedTime: String
    
    var body: some View {
        ScrollView {
            URLImage(image)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 7)
                .frame(height: 200)
                .offset(y: 10)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title)
                    .foregroundColor(.primary)
                
                HStack {
                    Text(site)
                    Spacer()
                    Text(publishedTime)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                Text("Summary:")
                Text(summary).lineLimit(.none)
                NavigationLink(
                    destination: WebView(url: URL(string: url)),
                    label: {
                        Text("Read More")
                    })
            }
            .padding()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(title: "Today is the day", summary: "New Xcode projects include one or more content view controllers classes for you to ... In Swift, include the weak keyword to prevent your view controller from holding a ... You do not need to store references to all views in your view hierarchy; store ... Implement delegate and action methods in dedicated objects that then ...", image: "https://i2.wp.com/ceklog.kindel.com/wp-content/uploads/2013/02/firefox_2018-07-10_07-50-11.png?w=641&ssl=1", url: "https://www.apple.com", site: "Apple Reports", publishedTime: "2021-01-2")
    }
}
