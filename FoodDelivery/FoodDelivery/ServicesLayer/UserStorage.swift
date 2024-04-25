//
//  UserStorage.swift
//  FoodDelivery
//
//  Created by Темирлан Асанбеков on 25/4/24.
//

import Foundation

class UserStorage {
    static let shared = UserStorage()
    private init() {}
    
    var passedOnboarding: Bool {
        get {
            UserDefaults.standard.bool(forKey: "passedOnboarding")
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "passedOnboarding")
        }
    }
}
