## Closures
#### Creating basic closures
```swift
let driving = {
    print("I'm driving in my car")
}

driving()
```
#### Accepting parameters in a closure
###### For example, we could make a closure that accepts a place name string as its only parameter like this:
```swift
let driving = { (place: String) in
    print("I'm going to \(place) in my car")
}
```
###### One of the differences between functions and closures is that you don’t use parameter labels when running closures. So, to call driving() now we’d write this:
```swift
driving("London")
```
#### Returning values from a closure

###### To demonstrate this, we’re going to take our driving() closure and make it return its value rather than print it directly. Here’s the original:
```swift
let driving = { (place: String) in
    print("I'm going to \(place) in my car")
}
```
###### We want a closure that returns a string rather than printing the message directly, so we need to use -> String before in, then use return just like a normal function:
```swift
let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
```
###### We can now run that closure and print its return value:
```swift
let message = drivingWithReturn("London")
print(message)
```
#### Closures as parameters

###### First, here’s our basic driving() closure again
```swift
let driving = {
    print("I'm driving in my car")
}
```
###### So, we can write a travel() function that accepts different kinds of traveling actions, and prints a message before and after:
```swift
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
```
###### We can now call that using our driving closure, like this:
```swift
travel(action: driving)
```
#### Trailing closure syntax
###### To demonstrate this, here’s our travel() function again. It accepts an action closure so that it can be run between two print() calls:
```swift
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
```
###### Because its last parameter is a closure, we can call travel() using trailing closure syntax like this:
```swift
travel() {
    print("I'm driving in my car")
}
```
###### In fact, because there aren’t any other parameters, we can eliminate the parentheses entirely:
```swift
travel {
    print("I'm driving in my car")
}
```
###### Trailing closure syntax is extremely common in Swift, so it’s worth getting used to.

