//
//  ContentView.swift
//  TSNA
//
//  Created by Caine Simpson on 6/18/21.
//

import SwiftUI

struct ContentView: View {
    @State var selected = 0
    var body: some View {
//        DashboardView()
        TabView(selection: $selected) {
            DashboardView().tabItem {
                Label("Featured", systemImage: "star")
            }.tag(0)
            ArticleListView().tabItem {
                Label("List", systemImage: "note.text")
            }.tag(1)
        }
    }
}
