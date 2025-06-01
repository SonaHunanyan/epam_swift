struct School{
    var people: [Person] = []
    
    enum SchoolRole {
        case student, teacher, administrator
    }
    
    class Person {
        let name: String
        let role: SchoolRole
        init(name: String, role: SchoolRole) {
            self.name = name
            self.role = role
        }
    }
    
    subscript(role: SchoolRole) -> [Person] {
        return people.filter({$0.role == role})
    }
    
    mutating func addPerson(_ person: Person) {
        people.append(person)
    }
}


func countStudents(_ school: School) -> Int {
    return school[.student].count
}

func countTeachers(_ school: School) -> Int {
    return school[.teacher].count
}

func countAdministrators(_ school: School) -> Int {
    return school[.administrator].count
}




