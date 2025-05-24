import CryptoKit
import Foundation


struct HashService {
    static func toSHA256(_ password: String) -> String {
          let inputData = Data(password.utf8)
          let hashed = SHA256.hash(data: inputData)
          let hashedText = hashed.compactMap { String(format: "%02x", $0) }.joined()
          return hashedText
      }
}


struct User {
    
    let username : String
    let email: String
    let password: String
    
    init(username: String, email: String, password: String) {
        self.username = username
        self.email = email
        self.password = HashService.toSHA256(password)
    }
    
}


class UserManager {
    var users: [String: User] = [:]
    
    func registerUser(username: String, email: String, password: String) -> Bool {
        let isUsernameExists = users.keys.contains(username)
        if isUsernameExists {
            return false
        }
        
        let isEmailExists = users.values.first(where: {$0.email == email}) != nil
        if isEmailExists {
            return false
        }
        users[username] = (User(username: username, email: email, password: password))
        return true
    }
    
    
    func login(username: String, password: String) -> Bool {
        let user = users[username]
        if user == nil {
            return false
        }
        return HashService.toSHA256(password) == user!.password
    }
    
  func removeUser(username: String) -> Bool {
      let user = users[username]
      if user == nil {
          return false
      }
      users.removeValue(forKey: username)
      return true
    }
    
    var userCount: Int {
        return users.count
    }
}

class AdminUser : UserManager {
    func listAllUsers() -> [String] {
        return  Array(users.keys)
    }
    
    deinit {
        print("Admin deleted")
    }
}
