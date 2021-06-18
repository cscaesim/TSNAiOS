//
//  APIServiceTests.swift
//  TSNATests
//
//  Created by Caine Simpson on 6/17/21.
//

@testable import TSNA
import XCTest

class APIServiceTests: XCTestCase {
    
    var apiService: APIService!
    
    override func setUp() {
        super.setUp()
        apiService = APIService()
    }
    
    override func tearDown() {
        super.tearDown()
        apiService = nil
    }
    
    func test_is_get_api_articles() throws {
        
    }
}
