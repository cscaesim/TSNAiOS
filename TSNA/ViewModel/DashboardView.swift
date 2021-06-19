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
                VStack {
                    ArticleRow(articles: viewModel.articles)
                    BlogRow(blogs: viewModel.blogs)
                    ReportRow(reports: viewModel.reports)
                }
                .navigationTitle("Featured")
                
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
        @Published var articles = [Article]()
        @Published var blogs = [Blog]()
        @Published var reports = [Report]()
        
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
    
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isLoading = false
            }
        }
        
        func getArticles() {
            dataService.getNews(limit: 10) { result in
                DispatchQueue.main.async {
                    self.articles = result
                }
            }
        }
        
        func getBlogs() {
            dataService.getBlogs(limit: 10) { result in
                DispatchQueue.main.async {
                    self.blogs = result
                }
            }
        }
        
        func getReports() {
            dataService.getReports(limit: 10) { result in
                DispatchQueue.main.async {
                    self.reports = result
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
