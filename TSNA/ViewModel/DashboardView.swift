//
//  ContentView.swift
//  TSNA
//
//  Created by Caine Simpson on 6/17/21.
//

import SwiftUI
var firstDashboardLoad = true

struct DashboardView: View {
    @StateObject var viewModel: ViewModel
    
    init(viewModel: ViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemBackground)
                List {
                    ForEach(viewModel.dataSet.keys.sorted(), id: \.self) { key in
                        ArticleRow(articles: viewModel.dataSet[key]!, title: key)
                    }
                }
                .listStyle(PlainListStyle())
                .frame(maxWidth: .infinity)
                .navigationTitle("News Dashboard")
                .redacted(reason: viewModel.isLoading ? .placeholder : [])
                
                if (viewModel.isLoading) {
                    LoadingScreen()
                }
            }
            .onAppear(perform: {
                print("Dashboard did load")
            })
        }
    }
    
}

extension DashboardView {
    class ViewModel: ObservableObject {
        
        let newsTypes = ["Articles", "Events"]
        
        let dataService: DataService
        let name = "Hello, Space News!"
        @Published var isLoading = false
        @Published var featuredArticle: Article!
        @Published var dataSet = [String: [Article]]()
        @Published var articles = [Article]()
        @Published var blogs = [Article]()
        @Published var reports = [Article]()
        
        @State var selectedOption = 0
        
        
        init(dataService: DataService = AppService()) {
            self.dataService = dataService
            getData()
        }
        
        func getData() {
            self.isLoading = true
            getArticles()
            getBlogs()
            getReports()
    
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.isLoading = false
            }
        }
        
        func getArticles() {
            dataService.getNews(limit: 10) { result in
                DispatchQueue.main.async {
                    self.articles = result
//                    self.dataSet.append(self.articles)
//                    self.dataSet = ["Articles": self.articles]
                    self.dataSet["Articles"] = self.articles
                }
            }
        }
        
        func getBlogs() {
            dataService.getBlogs(limit: 10) { result in
                DispatchQueue.main.async {
                    self.blogs = result
//                    self.dataSet.append(self.blogs)
//                    self.dataSet = ["Blogs": self.blogs]
                    self.dataSet["Blogs"] = self.blogs
                }
            }
        }
        
        func getReports() {
            dataService.getReports(limit: 10) { result in
                DispatchQueue.main.async {
                    self.reports = result
//                    self.dataSet.append(self.reports)
//                    self.dataSet = ["Reports": self.reports]
                    self.dataSet["Reports"] = self.reports
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}


//var body: some View {
//    VStack {
//        Picker(selection: viewModel.$selectedOption, label: Text("Articles"), content: {
//            Text("News").tag(0)
//            Text("Blogs").tag(1)
//            Text("Reports").tag(2)
//        }).pickerStyle(SegmentedPickerStyle())
//
//        TabView(selection: viewModel.$selectedOption,
//                content:  {
//                    Text("Tab Content 1").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 1")/*@END_MENU_TOKEN@*/ }.tag(1)
//                    Text("Tab Content 2").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }.tag(2)
//                })
//    }
//}
