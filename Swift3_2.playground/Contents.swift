struct School{
    enum SchoolRole {
        case student, teacher, administrator
    }
    
    class Person {
        init(name: String, role: SchoolRole) {
            self.name = name
            self.role = role
        }
        let name: String
        let role: SchoolRole
    }
    
    var people: [Person] = []
    
    subscript(role: SchoolRole) -> [Person] {
        return people.filter({$0.role == role})
    }
    
    mutating func addPerson(_ person: Person) {
        people.append(person)
    }
}


func countStudents(_ school: School) -> Int {
    return school[School.SchoolRole.student].count
}

func countTeachers(_ school: School) -> Int {
    return school[School.SchoolRole.teacher].count
}

func countAdministrators(_ school: School) -> Int {
    return school[School.SchoolRole.administrator].count
}





