//
//  APIClientTests.swift
//  Drew_Sullivan_CS_iOS_ProjectTests
//
//  Created by Drew Sullivan on 1/12/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import XCTest

@testable import Drew_Sullivan_CS_iOS_Project

class APIClientTests: XCTestCase {
    
    var sut: APIClient!
    var mockURLSession: MockURLSession!

    override func setUp() {
        super.setUp()
        
        sut = APIClient()
        mockURLSession = MockURLSession(data: nil, urlResponse: nil, error: nil)
        sut.session = mockURLSession
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func test_client_uses_expected_host() {
        let completion = { (accounts: [Account]?, error: Error?) in }
        let requestedData = RequestedData.listAccounts
        sut.fetchAccountData(with: requestedData, completion: completion)
        XCTAssertEqual(mockURLSession.urlComponents?.host, "glacial-bayou-77287.herokuapp.com")
    }
    
    func test_client_uses_expected_path() {
        let completion = { (accounts: [Account]?, error: Error?) in }
        let requestedData = RequestedData.listAccounts
        sut.fetchAccountData(with: requestedData, completion: completion)
        XCTAssertEqual(mockURLSession.urlComponents?.path, "/listAccounts")
    }
    
    func test_fetch_account_data_when_successful_returns_list_of_accounts() {
        let fakeJSONData = "[{\"name\": \"Royal Bank of Canada\", \"amount\" : 60032346.70, \"ROI\": 13.2, \"id\": 1},{\"name\": \"Offshore - Cayman Islands\",\"amount\" : 232393256.23, \"ROI\": 8.2, \"id\": 2}]".data(using: .utf8)
        mockURLSession = MockURLSession(data: fakeJSONData, urlResponse: nil, error: nil)
        sut.session = mockURLSession
        
        let accountListExpectation = expectation(description: "[Account]")
        var caughtAccounts: [Account]?
        
        sut.fetchAccountData(with: .listAccounts) { (accounts, _) in
            caughtAccounts = accounts
            accountListExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1) { _ in
            XCTAssertEqual(caughtAccounts?.count, 2)
        }
    }
    
    func test_fetch_account_data_when_data_is_nil_returns_error() {
        mockURLSession = MockURLSession(data: nil, urlResponse: nil, error: nil)
        sut.session = mockURLSession
        
        let errorExpectation = expectation(description: "error")
        var caughtError: Error?
        
        sut.fetchAccountData(with: .listAccounts) { (_, error) in
            caughtError = error
            errorExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1) { _ in
            XCTAssertNotNil(caughtError)
        }
    }
    
    func test_fetch_account_data_when_json_is_invalid_returns_error() {
        let badJSONData = "[{\"amount\" : 60032346.70, \"ROI\": 13.2, \"id\": 1},{\"name\": \"Offshore - Cayman Islands\",\"amount\" : 232393256.23, \"ROI\": 8.2, \"id\": 2}]".data(using: .utf8)
        mockURLSession = MockURLSession(data: badJSONData, urlResponse: nil, error: nil)
        sut.session = mockURLSession
        
        let errorExpectation = expectation(description: "error")
        var caughtError: Error?
        
        sut.fetchAccountData(with: .listAccounts) { (_, error) in
            caughtError = error
            errorExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1) { _ in
            XCTAssertNotNil(caughtError)
        }
    }
    
    func test_fetch_account_data_when_response_had_error_returns_error() {
        let fakeJSONData = "[{\"name\": \"Royal Bank of Canada\", \"amount\" : 60032346.70, \"ROI\": 13.2, \"id\": 1},{\"name\": \"Offshore - Cayman Islands\",\"amount\" : 232393256.23, \"ROI\": 8.2, \"id\": 2}]".data(using: .utf8)
        let error = NSError(domain: "FakeDomain", code: 1234, userInfo: nil)
        mockURLSession = MockURLSession(data: fakeJSONData, urlResponse: nil, error: error)
        sut.session = mockURLSession
        
        let errorExpectation = expectation(description: "error")
        var caughtError: Error?
        
        sut.fetchAccountData(with: .listAccounts) { (_, error) in
            caughtError = error
            errorExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 1) { _ in
            XCTAssertNotNil(caughtError)
        }
    }

}

extension APIClientTests {
    
    class MockURLSession: SessionProtocol {
        var url: URL?
        private let dataTask: MockDataTask
        
        init(data: Data?, urlResponse: URLResponse?, error: Error?) {
            dataTask = MockDataTask(data: data, urlResponse: urlResponse, error: error)
        }
        
        var urlComponents: URLComponents? {
            guard let url = url else { return nil }
            return URLComponents(url: url, resolvingAgainstBaseURL: true)
        }
        
        func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            self.url = url
            dataTask.completionHandler = completionHandler
            return dataTask
        }
    }
    
    class MockDataTask: URLSessionDataTask {
        var data: Data?
        var urlResponse: URLResponse?
        var responseError: Error?
        
        typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
        var completionHandler: CompletionHandler?
        
        init(data: Data?, urlResponse: URLResponse?, error: Error?) {
            self.data = data
            self.urlResponse = urlResponse
            self.responseError = error
        }
        
        override func resume() {
            DispatchQueue.main.async {
                self.completionHandler?(self.data, self.urlResponse, self.responseError)
            }
        }
    }
    
}
