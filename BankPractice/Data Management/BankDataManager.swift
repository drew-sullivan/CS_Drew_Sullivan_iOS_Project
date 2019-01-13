//
//  DataManager.swift
//  BankPracticeTests
//
//  Created by Drew Sullivan on 1/11/19.
//  Copyright © 2019 Drew Sullivan, DMA. All rights reserved.
//

import Foundation

public class BankDataManager: NSObject {
    
    private var banks: [Bank]
    public var numBanks: Int {
        return banks.count
    }
    
    public static let shared: BankDataManager = {
        let instance = BankDataManager()
        return instance
    }()
    
    private override init() {
        banks = [Bank]()
    }
    
    public func add(_ bank: Bank) {
        banks.append(bank)
    }
    
    public func clear() {
        banks = []
    }
    
    public func bank(at index: Int) -> Bank {
        return banks[index]
    }
    
}
