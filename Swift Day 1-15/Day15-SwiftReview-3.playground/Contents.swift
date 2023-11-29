import UIKit
// Creat day 15


 // Chapter One
 
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
 
 
 
 // Chapter Two
 
 struct Person {
 var clothes: String{
 willSet {
 updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
 }
 didSet{
 updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
 }
 }
 }
 
 func updateUI(msg: String){
 print(msg)
 }
 
 var taylor = Person(clothes: "T-shirts")
 taylor.clothes = "short skirts"
 

// Chapter Three

struct Person {
    var age: Int
    
    var ageInDogYears: Int {
        return age * 7
    }
}

var fan = Person(age: 25)
print(fan.ageInDogYears)
