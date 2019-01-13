//
//  DataManager.swift
//  Drew_Sullivan_CS_iOS_ProjectTests
//
//  Created by Drew Sullivan on 1/11/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import Foundation

public class AccountDataManager: NSObject {
    
    private var accounts: [Account]
    public var numAccounts: Int {
        return accounts.count
    }
    
    public static let shared: AccountDataManager = {
        let instance = AccountDataManager()
        return instance
    }()
    
    private override init() {
        accounts = [Account]()
    }
    
    public func add(_ account: Account) {
        accounts.append(account)
    }
    
    public func clear() {
        accounts = []
    }
    
    public func account(at index: Int) -> Account {
        return accounts[index]
    }
    
    public func getAccounts() -> [Account] {
        return accounts
    }
    
    public func fetchAccountDataFromAPI(completion: @escaping (Bool) -> Void) {
        let apiClient = APIClient()
        apiClient.fetchAccountData(with: .listAccounts) { (accounts, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
            } else {
                if let accounts = accounts {
                    print("Account data retrieved")
                    self.accounts = accounts
                    completion(true)
                }
            }
        }
    }
    
}
