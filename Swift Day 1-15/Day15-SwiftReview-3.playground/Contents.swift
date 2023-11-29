import UIKit
// Creat day 15

struct Person {
    var clothes: String
    var shoes: String
    
    func describe(){
        print("I like wearing \(clothes) with \(shoes)")
    }
}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")
taylor.describe()
other.describe()
