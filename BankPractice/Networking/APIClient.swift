//
//  APIClient.swift
//  BankPractice
//
//  Created by Drew Sullivan on 1/12/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import Foundation

class APIClient {
    
    lazy var session: SessionProtocol = URLSession.shared
    
    func fetchBankData(with requestedData: RequestedData, completion: @escaping ([Bank]?, Error?) -> Void) {
        guard let url = URL(string: "https://glacial-bayou-77287.herokuapp.com/\(requestedData)") else {
            fatalError()
        }
        session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(nil, WebserviceError.responseError)
                return
            }
            
            guard let data = data else {
                completion(nil, WebserviceError.dataEmptyError)
                return
            }
            
            do {
                let banks: [Bank] = try JSONDecoder().decode([Bank].self, from: data)
                completion(banks, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}

protocol SessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: SessionProtocol {}

enum RequestedData: String {
    case listAccounts = "listAccounts"
}

enum WebserviceError: Error {
    case dataEmptyError
    case responseError
}
