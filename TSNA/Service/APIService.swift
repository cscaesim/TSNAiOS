//
//  APIService.swift
//  TSNA
//
//  Created by Caine Simpson on 6/17/21.
//

import Foundation

protocol NetworkService {
    func getNewsAPICall(completion: @escaping ([Article]) -> Void)
    func getBlogsAPICall(completion: @escaping ([Blog]) -> Void)
}

class APIService: NetworkService {
    let url = "https://api.spaceflightnewsapi.net/v3/"
    
    func getNewsAPICall(completion: @escaping ([Article]) -> Void) {
        let url = "\(url)articles"
        let jsonDecoder = JSONDecoder()
        
        let request = URLRequest(url: URL(string: url)!)
        let session = URLSession.shared
        
        session.dataTask(with: request) { data, response, error in
            if error != nil {
                print("ERROR ", error!)
            } else {
                do {
                    if (data != nil) {
//                        print(data!)
                        let articles = try jsonDecoder.decode([Article].self, from: data!)
                        completion(articles)
                    }
                } catch let error {
                    print("erro \(error)")
                }
            }
        }.resume()
    }
    
    
    func getBlogsAPICall(completion: @escaping ([Blog]) -> Void) {
        let url = "\(url)blogs"
        let jsonDecoder = JSONDecoder()
        
        let request = URLRequest(url: URL(string: url)!)
        let session = URLSession.shared
        
        session.dataTask(with: request) { data, response, error in
            if error != nil {
                print("ERROR ", error!)
            } else {
                do {
                    if (data != nil) {
                        print(data!)
                        let articles = try jsonDecoder.decode([Blog].self, from: data!)
                        completion(articles)
                    }
                } catch let error {
                    print("erro \(error)")
                }
            }
        }.resume()
    }
    
    func getReportsAPICall(completion: @escaping ([Report]) -> Void) {
        let url = "\(url)reports"
        let jsonDecoder = JSONDecoder()
        
        let request = URLRequest(url: URL(string: url)!)
        let session = URLSession.shared
        
        session.dataTask(with: request) { data, response, error in
            if error != nil {
                print("ERROR ", error!)
            } else {
                do {
                    if (data != nil) {
                        print(data!)
                        let articles = try jsonDecoder.decode([Report].self, from: data!)
                        completion(articles)
                    }
                } catch let error {
                    print("erro \(error)")
                }
            }
        }.resume()
    }
}
