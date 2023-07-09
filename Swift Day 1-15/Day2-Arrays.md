## Day 2
### Arrays
```swift
let salih = "Salih Kertik"
let paul = "Paul Michel"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [salih, paul, george, ringo]

beatles[0]
//Be careful: Swift crashes if you read an item that doesn’t exist. For example, trying to read beatles[9] is a bad idea.
```

### Sets
```swift
let colors = Set(["red", "green", "blue"])

//If you try to insert a duplicate item into a set, the duplicates get ignored. For example:
let colors2 = Set(["red", "green", "blue", "red", "blue"])
//The final colors2 set will still only include red, green, and blue once.
```

### Tuples
```swift
var name = (first: "Salih", last: "Kertik")
name.0 // Output: Salih
name.first //Output: Salih
```

### Arrays vs sets vs tuples
```swift
//If you need a specific, fixed collection of related values where each item has a precise position or name, you should use a tuple:
let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")

//If you need a collection of values that must be unique or you need to be able to check whether a specific item is in there extremely quickly, you should use a set:
let set = Set(["aardvark", "astronaut", "azalea"])

//If you need a collection of values that can contain duplicates, or the order of your items matters, you should use an array:
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
```

### Dictionaries
```swift
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
heights["Taylor Swift"]
```


### Dictionary default values
```swift
let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]
//We can read Paul’s favorite ice cream like this:
favoriteIceCream["Paul"]

//But if we tried reading the favorite ice cream for Charlotte, we’d get back nil, meaning that Swift doesn’t have a value for that key:
favoriteIceCream["Charlotte"]
//We can fix this by giving the dictionary a default value of “Unknown”, so that when no ice cream is found for Charlotte we get back “Unknown” rather than nil:
favoriteIceCream["Charlotte", default: "Unknown"]
```
