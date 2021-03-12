class Person {
    var name: String
    var birthYear: Int
    
    init(name: String, birthYear: Int) {
        self.name = name
        self.birthYear = birthYear
    }
    
    func displayAge() {
        let age = 2021 - self.birthYear
        
        print("\(name) has \(age) years old.");
    }
}


let person = Person(name: "Adam", birthYear: 1998)
person.displayAge()
