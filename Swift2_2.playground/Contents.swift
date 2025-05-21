class Person {
    let name: String
    let age: Int
    
  required init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    convenience init?(name: String, age: Int, adult: Bool) {
          if adult && age < 16 {
              return nil
          }
        self.init(name: name, age: age)
      }
}



class Student: Person {
    let studentID: String
    let major: String
    
    required init(name: String, age: Int, studentID: String, major: String) {
        self.studentID = studentID
        self.major = major
        super.init(name: name, age: age)
    }
    
    convenience init? (studentID: String, major: String, name: String){
        self.init(name: name, age: 16, studentID: studentID, major: major)
    }
    
    required init(name: String, age: Int) {
        self.studentID = "UNKNOWN"
        self.major = "UNKNOWN"
        super.init(name: name, age: age)
    }
}


class Professor: Person{
    let faculty: String
    
    required init(faculty: String, name: String, age: Int) {
        self.faculty = faculty
        super.init(name: name, age: age)
    }
    
    required init(name: String, age: Int) {
        self.faculty = "UNKNOWN"
        super.init(name: name, age: age)
    }
}

struct University{
    let name: String
    let location: String
}
