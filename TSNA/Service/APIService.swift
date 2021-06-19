//
//  APIService.swift
//  TSNA
//
//  Created by Caine Simpson on 6/17/21.
//

import Foundation

protocol NetworkService {
    func getNewsAPICall(limit: Int, completion: @escaping ([Article]) -> Void)
    func getBlogsAPICall(limit: Int, completion: @escaping ([Article]) -> Void)
    func getReportsAPICall(limit: Int, completion: @escaping ([Article]) -> Void)
}

class APIService: NetworkService {
    
    let url = "https://api.spaceflightnewsapi.net/v3/"
    
    func getNewsAPICall(limit: Int = 0, completion: @escaping ([Article]) -> Void) {
        var url = "\(url)"
        if limit != 0 {
             url = "\(url)articles?_limit=\(limit)"
        } else {
            url = "\(url)articles"
        }
        
        print(url)
        
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
    
    
    func getBlogsAPICall(limit: Int = 0, completion: @escaping ([Article]) -> Void) {
        var url = "\(url)blogs"
        
        if limit != 0 {
             url = "\(url)?_limit=\(limit)"
        } else {
            url = "\(url)"
        }
        
        print(url)
        
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
                        let articles = try jsonDecoder.decode([Article].self, from: data!)
                        completion(articles)
                    }
                } catch let error {
                    print("erro \(error)")
                }
            }
        }.resume()
    }
    
    func getReportsAPICall(limit: Int = 0, completion: @escaping ([Article]) -> Void) {
        
        var url = "\(url)reports"
        
        if limit != 0 {
             url = "\(url)?_limit=\(limit)"
        } else {
            url = "\(url)"
        }
        
        print(url)
        
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
                        let articles = try jsonDecoder.decode([Article].self, from: data!)
                        completion(articles)
                    }
                } catch let error {
                    print("erro \(error)")
                }
            }
        }.resume()
    }
}
