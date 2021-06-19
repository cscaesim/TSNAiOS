//
//  ArticleListView.swift
//  TSNA
//
//  Created by Caine Simpson on 6/17/21.
//

import SwiftUI



struct ArticleListView: View {
    @StateObject var viewModel: ViewModel
    @State private var selected = 0
    
    init(viewModel: ViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Picker(selection: $selected, label: Text("Toast")) {
                        Text("News").tag(0)
                        Text("Blogs").tag(1)
                        Text("Reports").tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    TabView(selection: $selected) {
                        NewsList(isLoading: false, articles: viewModel.articles, blogs: nil, reports: nil).tag(0).redacted(reason: viewModel.isLoading ? .placeholder : [])
                        NewsList(isLoading: false, articles: nil, blogs: viewModel.blogs, reports: nil).tag(1).redacted(reason: viewModel.isLoading ? .placeholder : [])
                        NewsList(isLoading: false, articles: nil, blogs: nil, reports: viewModel.reports).tag(2).redacted(reason: viewModel.isLoading ? .placeholder : [])
                    }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }.navigationTitle("News List")
                if (viewModel.isLoading) {
                    LoadingScreen()
                }
            }
        }
    }
}

extension ArticleListView {
    class ViewModel: ObservableObject {
        
        let dataService: DataService
        
        @Published var isLoading = false
        @Published var featuredArticle: Article!
        @Published var articles = [Article]()
        @Published var blogs = [Article]()
        @Published var reports = [Article]()
        
        @State var selectedOption = 0
        
        init(dataService: DataService = AppService()) {
            self.dataService = dataService
            getData()
        }
        
        func getData() {
            isLoading = true
            getArticles()
            getBlogs()
            getReports()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.isLoading = false
            }
        }
        
        func getArticles() {
            dataService.getNews(limit: 30) { result in
                DispatchQueue.main.async {
                    self.articles = result
                }
            }
        }
        
        func getBlogs() {
            dataService.getBlogs(limit: 30) { result in
                DispatchQueue.main.async {
                    self.blogs = result
                }
            }
        }
        
        func getReports() {
            dataService.getReports(limit: 30) { result in
                DispatchQueue.main.async {
                    self.reports = result
                }
            }
        }
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}
