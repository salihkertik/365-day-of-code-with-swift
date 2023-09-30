## Swift Review - Day 1

### Variables and Constants

```swift
var name = "Tim McGraw"
```

###### can be changed later
```swift
var name = "Tim McGraw"
name = "Romeo"
```
###### cannot be changed later
```swift
let name = "Tim McGraw"
name = "Romeo" // It gives an error because of the let variable.
```

### Types of Data
```swift
var name: String
name = "Tim McGraw"

var age: Int
age = 25

var latitude: Double
latitude = 36.166667


var longitude: Float
longitude = -86.783333


var stayOutTooLate: Bool
stayOutTooLate = true

var nothingInBrain: Bool
nothingInBrain = true

var missABeat: Bool
missABeat = false


var name = "Tim McGraw"
###### Preferred
var name: String
name = "Tim McGraw"
```

### Operators
```swift
var a = 10
a = a + 1 // 11
a = a - 1 // 10
a = a * a // 100

var b = 10
b += 10 // 20
b -= 10 // 10

var a = 1.1
var b = 2.2
var c = a + b // 3.3


var name1 = "Tim McGraw"
var name2 = "Romeo"
var both = name1 + " and " + name2 // "Tim McGraw and Romeo"


9%3 // remaining from the section = 0
10%3 // remaining from the section = 1

var a = 1.1
var b = 2.2
var c = a + b // 3.3

c > 3 // true
c >= 3 // true
c > 4 // false
c < 4 // true

var name = "Tim McGraw"
name == "Tim McGraw" // true


var name = "Tim McGraw"
name == "Tim McGraw" // true
name != "Tim McGraw" // false
```
### String Interpolation
```swift
var name = "Tim McGraw"
"Your name is \(name)" // Your name is Tim McGraw

var name = "Tim McGraw"
var age = 25
var latitude = 36.166667

"Your name is \(name), your age is \(age), and your latitude is \(latitude)"
// Result = " Your name is Tim McGraw, your age is 25, and your latitude is 36.166667 "

var age = 25
"You are \(age) years old. In another \(age) years you will be \(age * 2)."
// result = " You are 25 years old. In another 25 years you will be 50 "
```
### Arrays
```swift
var songs = ["Shake it Off", "You Belong with Me", "Back to December"]
songs[0]
songs[1]
songs[2]

var songs = ["Shake it Off", "You Belong with Me", "Love Story"]
var songs2 = ["Today was a Fairytale", "Welcome to New York", "Fifteen"]
var both = songs + songs2

// You can also use += to add and assign, like this:

both += ["Everything has Changed"]
```
### Dictionaries
```swift
var person = ["Taylor", "Alison", "Swift", "December", "taylorswift.com"]

// With dictionaries we can re-write this to be far more sensible, because rather than arbitrary numbers you get to read and write values using a key you specify. For example:

var person = ["first": "Taylor", "middle": "Alison", "last": "Swift", "month": "December", "website": "taylorswift.com"]
person["middle"]
person["month"]

// It might help if I use lots of whitespace to break up the dictionary on your screen, like this:

var person = [
                "first": "Taylor",
                "middle": "Alison",
                "last": "Swift",
                "month": "December",
                "website": "taylorswift.com"
            ]

person["middle"]
person["month"]

// As you can see, when you make a dictionary you write its key, then a colon, then its value. You can then read any value from the dictionary just by knowing its key, which is much easier to work with.

// As with arrays, you can store a wide variety of values inside dictionaries, although the keys are most commonly strings.
```

### Conditional Statements

```swift
var action: String
var person = "hater"

if person == "hater" {
    action = "hate"
}

// That uses the == (equality) operator introduced previously to check whether the string inside person is exactly equivalent to the string "hater". If it is, it sets the action variable to "hate". Note that open and close braces, also known by their less technical name of "curly brackets" – that marks the start and end of the code that will be executed if the condition is true.

// Let's add else if and else blocks:

var action: String
var person = "hater"

if person == "hater" {
    action = "hate"
} else if person == "player" {
    action = "play"
} else {
    action = "cruise"
}
// That will check each condition in order, and only one of the blocks will be executed: a person is either a hater, a player, or anything else.


var action: String
var stayOutTooLate = true
var nothingInBrain = true

if stayOutTooLate && nothingInBrain {
    action = "cruise"
}

//This might sound deeply philosophical, but actually this is important: sometimes you care whether a condition is not true, i.e. is false. You can do this with the ! (not) operator that was introduced earlier. For example:

if !stayOutTooLate && !nothingInBrain {
    action = "cruise"
}
```
### Loops
```swift
// Tiring;
print("1 x 10 is \(1 * 10)")
print("2 x 10 is \(2 * 10)")
print("3 x 10 is \(3 * 10)")
print("4 x 10 is \(4 * 10)")
print("5 x 10 is \(5 * 10)")
print("6 x 10 is \(6 * 10)")
print("7 x 10 is \(7 * 10)")
print("8 x 10 is \(8 * 10)")
print("9 x 10 is \(9 * 10)")
print("10 x 10 is \(10 * 10)")

// Recommended

for i in 1...10 {
    print("\(i) x 10 is \(i * 10)")
}



var str = "Fakers gonna"

for _ in 1...5 {
    str += " fake"
}

print(str) // Result: Fakers gonna fake fake fake fake fake

// Looping over arrays

var songs = ["Shake it Off", "You Belong with Me", "Look What You Made Me Do"]

for song in songs {
    print("My favorite song is \(song)")
}


//You can also use the for i in loop construct to loop through arrays, because you can use that constant to index into an array. We could even use it to index into two arrays, like this:

var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0...3 {
    print("\(people[i]) gonna \(actions[i])")
}


// To count how many items are in an array, use someArray.count. So, we could rewrite our code like this:

var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0..<people.count {
    print("\(people[i]) gonna \(actions[i])")
}

// Inner loops
var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0..<people.count {
    var str = "\(people[i]) gonna"

    for _ in 1...5 {
        str += " \(actions[i])"
    }

    print(str)
}

// While loops

var counter = 0

while true {
    print("Counter is now \(counter)")
    counter += 1

    if counter == 556 {
        break
    }
}

// Continue

var songs = ["Shake it Off", "You Belong with Me", "Look What You Made Me Do"]

for song in songs {
    if song == "You Belong with Me" {
        continue
    }

    print("My favorite song is \(song)")
}
```
### Switch Case
```swift
let liveAlbums = 2

switch liveAlbums {
case 0:
    print("You're just starting out")

case 1:
    print("You just released iTunes Live From SoHo")

case 2:
    print("You just released Speak Now World Tour")

default:
    print("Have you done something new?")
}

// Swift can apply some evaluation to your case statements in order to match against variables. For example, if you wanted to check for a range of possible values, you could use the closed range operator like this:


let studioAlbums = 5

switch studioAlbums {
case 0...1:
    print("You're just starting out")

case 2...3:
    print("You're a rising star")

case 4...5:
    print("You're world famous!")

default:
    print("Have you done something new?")
}

// One thing you should know is that switch/case blocks in Swift don't fall through like they do in some other languages you might have seen. If you're used to writing break in your case blocks, you should know this isn't needed in Swift.

// Instead, you use the fallthrough keyword to make one case fall into the next – it's effectively the opposite. Of course, if you have no idea what any of this means, that's even better: don't worry about it!
```

