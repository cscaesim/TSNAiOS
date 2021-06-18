//
//  AppService.swift
//  TSNA
//
//  Created by Caine Simpson on 6/17/21.
//

import Foundation


protocol DataService {
//    func getNews(completion: @escaping ([Article]) -> Void)
    func getNews(completion: @escaping ([Article]) -> Void)
    func getBlogs(completion: @escaping ([Blog]) -> Void)
    func getReports(completion: @escaping ([Report]) -> Void)
}

class AppService: DataService {
    
    let apiService: APIService
    
    init() {
        apiService = APIService()
    }
    
    func getNews(completion: @escaping ([Article]) -> Void) {
        apiService.getNewsAPICall { (articles) in
            completion(articles)
        }
    }
    
    func getBlogs(completion: @escaping ([Blog]) -> Void) {
        apiService.getBlogsAPICall { (blogs) in
            completion(blogs)
        }
    }
    
    func getReports(completion: @escaping ([Report]) -> Void) {
        apiService.getReportsAPICall { (reports) in
            completion(reports)
        }
    }
}
