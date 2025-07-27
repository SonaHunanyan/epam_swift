//
//  AuthStore.swift
//  Storage2
//
//  Created by Sona Hunanyan on 28.07.25.
//

import Foundation



class AuthStore {
    static let instance = AuthStore()
    
    func saveEmail(_ email: String){
        UserDefaults.standard.set(email, forKey: StoreKeys.email)

    }
    
    func updateLoggedInStatus(status: Bool) {
        UserDefaults.standard.set(status, forKey: StoreKeys.isLoggedIn)
    }
    
    func getLoggedInStatus() -> Bool {
        UserDefaults.standard.bool(forKey: StoreKeys.isLoggedIn)
    }
    
    func getEmail() -> String? {
      return  UserDefaults.standard.string(forKey: StoreKeys.email)
    }
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: StoreKeys.email)
        UserDefaults.standard.set(false, forKey: StoreKeys.isLoggedIn)
    }
}
