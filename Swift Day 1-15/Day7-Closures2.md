## Closures Part 2
#### Closures with multiple parameters
###### This time our travel() function will require a closure that specifies where someone is traveling to, and the speed they are going. This means we need to use (String, Int) -> String for the parameter’s type:
```swift
func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}
```
###### We’re going to call that using a trailing closure and shorthand closure parameter names. Because this accepts two parameters, we’ll be getting both $0 and $1:
```swift
travel {
    "I'm going to \($0) at \($1) miles per hour."
}
```
###### Some people prefer not to use shorthand parameter names like $0 because it can be confusing, and that’s OK – do whatever works best for you.
#### Returning closures from functions
###### To try this out, we’re going to write a travel() function that accepts no parameters, but returns a closure. The closure that gets returned must be called with a string, and will return nothing.

###### Here’s how that looks in Swift:
```swift
func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}
```
###### We can now call travel() to get back that closure, then call it as a function:
```swift
let result = travel()
result("London")
```
###### It’s technically allowable – although really not recommended! – to call the return value from travel() directly:
```swift
let result2 = travel()("London")
```
#### Capturing values
###### Right now we have a travel() function that returns a closure, and the returned closure accepts a string as its only parameter and returns nothing:
```swift
func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}
```
###### We can call travel() to get back the closure, then call that closure freely:
```swift
let result = travel()
result("London")
```
###### Closure capturing happens if we create values in travel() that get used inside the closure. For example, we might want to track how often the returned closure is called
```swift
func travel() -> (String) -> Void {
    var counter = 1

    return {
       print("\(counter). I'm going to \($0)")
       counter += 1
    }
}
```
###### Even though that counter variable was created inside travel(), it gets captured by the closure so it will still remain alive for that closure.
                                                                                                                                    
###### So, if we call result("London") multiple times, the counter will go up and up:
```swift
result("London")
result("London")
result("London")
```
