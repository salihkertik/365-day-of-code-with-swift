## Day 1

### Variables
```swift
var str = "Hello, playground"
```

### Strings and Integers

```swift
str = "Goodbye"
var age = 38
```

##### If you have large numbers, Swift lets you use underscores as thousands separators – they don’t change the number, but they do make it easier to read.
```swift
var population = 8_000_000
```
### Multi-line strings
##### If you want multi-line strings you need slightly different syntax: start and end with three double quote marks,
```swift
var str1 = """
This goes
over multiple
lines
"""

var str2 = """
This goes \
over multiple \
lines
"""
```
### Doubles and Booleans
```swift
var pi = 3.141
var awesome = true
```

### String interpolation
```swift
var score = 85
var str3 = "Your score was \(score)"
var results = "The test results are here: \(str3)"
```

### Constants
```swift
let taylor = "swift"
```

### Type annotations
##### If you want you can be explicit about the type of your data rather than relying on Swift’s type inference, like this:
```swift
let strr = "Hello, playground"
let album: String = "Reputation"
let year: Int = 1989
let height: Double = 1.78
let taylorRocks: Bool = true
```

### Simple types: Summary
###### 1) You make variables using var and constants using let. It’s preferable to use constants as often as possible.

###### 2) Strings start and end with double quotes, but if you want them to run across multiple lines you should use three sets of double quotes.

###### 3) Integers hold whole numbers, doubles hold fractional numbers, and booleans hold true or false.

###### 4) String interpolation allows you to create strings from other variables and constants, placing their values inside your string.

###### 5) Swift uses type inference to assign each variable or constant a type, but you can provide explicit types if you want.






