## Structs

### Creating your own structs

###### Swift lets you design your own types in two ways, of which the most common are called structures, or just structs. Structs can be given their own variables and constants, and their own functions, then created and used however you want.

###### Let’s start with a simple example: we’re going to create a Sport struct that stores its name as a string. Variables inside structs are called properties, so this is a struct with one property:
```swift
struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)

tennis.name = "Lawn Tennis"
```

### Computed properties

###### That has a name property that stores a String. These are called stored properties, because Swift has a different kind of property called a computed property – a property that runs code to figure out its value.

###### We’re going to add another stored property to the Sport struct, then a computed property. Here’s how that looks:
```swift
struct Sport {
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)
```
### Property observers

###### Property observers let you run code before or after any property changes. To demonstrate this, we’ll write a Progress struct that tracks a task and a completion percentage:
```swift
struct Progress {
    var task: String
    var amount: Int
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100


struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}
```
### Methods

###### Structs can have functions inside them, and those functions can use the properties of the struct as they need to. Functions inside structs are called methods, but they still use the same func keyword.

###### We can demonstrate this with a City struct. This will have a population property that stores how many people are in the city, plus a collectTaxes() method that returns the population count multiplied by 1000. Because the method belongs to City it can read the current city’s population property.
```swift
struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}


let london = City(population: 9_000_000)
london.collectTaxes()
```

### Mutating methods


###### The problem is that when you create the struct Swift has no idea whether you will use it with constants or variables, so by default it takes the safe approach: Swift won’t let you write methods that change properties unless you specifically request it.

###### When you want to change a property inside a method, you need to mark it using the mutating keyword, like this:
```swift
struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Ed")
person.makeAnonymous()
```

### Properties and methods of strings


###### We’ve used lots of strings so far, and it turns out they are structs – they have their own methods and properties we can use to query and manipulate the string.

###### First, let’s create a test string:
```swift
let string = "Do or do not, there is no try."
```
###### You can read the number of characters in a string using its count property:
```swift
print(string.count)
```
###### They have a hasPrefix() method that returns true if the string starts with specific letters:
```swift
print(string.hasPrefix("Do"))
```
###### You can uppercase a string by calling its uppercased() method:
```swift
print(string.uppercased())
```
###### And you can even have Swift sort the letters of the string into an array:
```swift
print(string.sorted())
```

### Properties and methods of arrays
###### Arrays are also structs, which means they too have their own methods and properties we can use to query and manipulate the array.
```swift
var toys = ["Woody"]
```
###### You can read the number of items in an array using its count property:
```swift
print(toys.count)
```
###### If you want to add a new item, use the append() method like this:
```swift
toys.append("Buzz")
```
###### You can locate any item inside an array using its firstIndex() method, like this:
```swift
toys.firstIndex(of: "Buzz")
```
###### That will return 1 because arrays count from 0.
###### Just like with strings, you can have Swift sort the items of the array alphabetically:
```swift
print(toys.sorted())
```
###### Finally, if you want to remove an item, use the remove() method like this:
```swift
toys.remove(at: 0)
```
