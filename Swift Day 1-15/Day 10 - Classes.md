## Classes and inheritance

### Creating your own classes


###### The first difference between classes and structs is that classes never come with a memberwise initializer. This means if you have properties in your class, you must always create your own initializer.
                                                                          
```swift
class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}
```
###### Creating instances of that class looks just the same as if it were a struct:
```swift
let poppy = Dog(name: "Poppy", breed: "Poodle")
```

### Class inheritance

###### This is called class inheritance or subclassing, the class you inherit from is called the “parent” or “super” class, and the new class is called the “child” class.
```swift
class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}
```
###### We could create a new class based on that one called Poodle. It will inherit the same properties and initializer as Dog by default:
```swift
class Poodle: Dog {

}
```
###### However, we can also give Poodle its own initializer. We know it will always have the breed “Poodle”, so we can make a new initializer that only needs a name property. Even better, we can make the Poodle initializer call the Dog initializer directly so that all the same setup happens:
```swift
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
}
```

### Overriding methods

###### Child classes can replace parent methods with their own implementations – a process known as overriding. Here’s a trivial Dog class with a makeNoise() method:

```swift
class Dog {
    func makeNoise() {
        print("Woof!")
    }
}
```

###### If we create a new Poodle class that inherits from Dog, it will inherit the makeNoise() method. So, this will print “Woof!”:
```swift
class Poodle: Dog {
}

let poppy = Poodle()
poppy.makeNoise()
```
###### Method overriding allows us to change the implementation of makeNoise() for the Poodle class.

###### Swift requires us to use override func rather than just func when overriding a method – it stops you from overriding a method by accident, and you’ll get an error if you try to override something that doesn’t exist on the parent class:
```swift
class Poodle: Dog {
    override func makeNoise() {
        print("Yip!")
    }
}
```
###### With that change, poppy.makeNoise() will print “Yip!” rather than “Woof!”.

### Final Classes

###### Although class inheritance is very useful – and in fact large parts of Apple’s platforms require you to use it – sometimes you want to disallow other developers from building their own class based on yours.



###### Swift gives us a final keyword just for this purpose: when you declare a class as being final, no other class can inherit from it. This means they can’t override your methods in order to change your behavior – they need to use your class the way it was written.



###### To make a class final just put the final keyword before it, like this:
```swift
final class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}
```
### Copying Objects

###### The third difference between classes and structs is how they are copied. When you copy a struct, both the original and the copy are different things – changing one won’t change the other. When you copy a class, both the original and the copy point to the same thing, so changing one does change the other.

###### For example, here’s a simple Singer class that has a name property with a default value:
```swift
class Singer {
    var name = "Taylor Swift"
}
```
###### If we create an instance of that class and prints its name, we’ll get “Taylor Swift”:
```swift
var singer = Singer()
print(singer.name)
```

###### Now let’s create a second variable from the first one and change its name:
```swift
var singerCopy = singer
singerCopy.name = "Müslüm Gürses"
```
###### Because of the way classes work, both singer and singerCopy point to the same object in memory, so when we print the singer name again we’ll see “Justin Bieber”:
```swift
print(singer.name)
```
###### On the other hand, if Singer were a struct then we would get “Taylor Swift” printed a second time:
```swift
struct Singer {
    var name = "Taylor Swift"
}
```

### Deinitializers

###### The fourth difference between classes and structs is that classes can have deinitializers – code that gets run when an instance of a class is destroyed.

###### To demonstrate this, here’s a Person class with a name property, a simple initializer, and a printGreeting() method that prints a message:
```swift
class Person {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
}
```

###### We’re going to create a few instances of the Person class inside a loop, because each time the loop goes around a new person will be created then destroyed:
```swift
for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}
```
###### And now for the deinitializer. This will be called when the Person instance is being destroyed:
```swift
deinit {
    print("\(name) is no more!")
}
```
### Mutability


###### The final difference between classes and structs is the way they deal with constants. If you have a constant struct with a variable property, that property can’t be changed because the struct itself is constant.

###### However, if you have a constant class with a variable property, that property can be changed. Because of this, classes don’t need the mutating keyword with methods that change properties; that’s only needed with structs.

###### This difference means you can change any variable property on a class even when the class is created as a constant – this is perfectly valid code:
```swift
class Singer {
    var name = "Taylor Swift"
}

let taylor = Singer()
taylor.name = "Ed Sheeran"
print(taylor.name)
```

###### If you want to stop that from happening you need to make the property constant:
```swift
class Singer {
    let name = "Taylor Swift"
}
```
