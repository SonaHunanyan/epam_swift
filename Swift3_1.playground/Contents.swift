import Foundation

protocol Borrowable {
    var borrowDate:  Date? {get set}
    var returnDate: Date? {get set}
    var isBorrowed: Bool {get set}
}


extension Borrowable{
    func isOverdue() -> Bool {
        if let returnDate = returnDate {
            return Date.now > returnDate
        }
        return false
    }
    
    mutating func checkIn() {
        self.borrowDate = nil
        self.returnDate = nil
        self.isBorrowed = false
    }
}


class Item {
    let id: String
    let title: String
    let author: String
    
    init(id: String, title: String, author: String) {
        self.id = id
        self.title = title
        self.author = author
    }
}


class Book : Item, Borrowable{
    var borrowDate: Date?
    var returnDate: Date?
    var isBorrowed: Bool
    
    override init(id: String, title: String, author: String) {
        self.borrowDate = nil
        self.returnDate = nil
        self.isBorrowed = false
        super.init(id: id, title: title, author: author)
    }
}


enum LibraryError: Error {
    case itemNotFound, itemNotBorrowable, alreadyBorrowed
}


class Library {
    var items: [String:Item] = [:]
    
    func addBook(_ book: Book){
        items[book.id] = book
    }
    
    func borrowItem(by id: String) throws -> Item {
        guard let item = items[id] else {
            throw LibraryError.itemNotFound
        }
        guard var borrowableItem =  item as? Borrowable else {
            throw LibraryError.itemNotBorrowable
        }
        
        guard borrowableItem.isBorrowed == false else {
            throw LibraryError.alreadyBorrowed
        }
        borrowableItem.borrowDate = Date.now
        borrowableItem.isBorrowed = true
        borrowableItem.returnDate = Calendar.current.date(byAdding: .day, value: 14, to: Date())
        return borrowableItem as! Item
    }
}
