//
//  AppService.swift
//  TSNA
//
//  Created by Caine Simpson on 6/17/21.
//

import Foundation


protocol DataService {
//    func getNews(completion: @escaping ([Article]) -> Void)
    func getNews(limit: Int, completion: @escaping ([Article]) -> Void)
    func getBlogs(limit: Int, completion: @escaping ([Blog]) -> Void)
    func getReports(limit: Int, completion: @escaping ([Report]) -> Void)
}

class AppService: DataService {
    
    let apiService: APIService
    
    init() {
        apiService = APIService()
    }
    
    func getNews(limit: Int = 0, completion: @escaping ([Article]) -> Void) {
        apiService.getNewsAPICall(limit: limit) { (articles) in
            completion(articles)
        }
    }
    
    func getBlogs(limit: Int = 0, completion: @escaping ([Blog]) -> Void) {
        apiService.getBlogsAPICall(limit: limit) { (blogs) in
            completion(blogs)
        }
    }
    
    func getReports(limit: Int = 0, completion: @escaping ([Report]) -> Void) {
        apiService.getReportsAPICall(limit: limit) { (reports) in
            completion(reports)
        }
    }
}
