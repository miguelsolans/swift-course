import Foundation

struct MyStructure {
    let instanceProperty = "ABC"
    static let typeProperty = "123"
    
    func instanceMethod() {
        
    }
    
    static func typeMethod() {
        print("Type Method")
    }
}

// To use instance property we need to instantiate MyStructure
let structure = MyStructure();
print("Instance Property: \(structure.instanceProperty)");

// To use typeProperty we do not need to instantiate
print("Type Property: \(MyStructure.typeProperty)");


MyStructure.typeMethod()
