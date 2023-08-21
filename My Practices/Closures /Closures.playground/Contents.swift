import UIKit

// Ders 1 - Closures:

// Closures, Swift dilinde işlevlerin (functions) taşınabilir bir şekilde kullanılmasını sağlar. Basit bir fonksiyon gibi düşünebiliriz, ancak daha esnek ve kullanışlıdır.

// Temel bir closure oluşturma:


let sayHello = {
    print("Merhaba!")
}
sayHello()


// Parametreleri olan bir closure kullanma:

let greetPerson = { (name: String) in
    print("Merhaba, \(name)!")
    
}
greetPerson("Salih")


// Closure'dan değer döndürme:

let multiply = { (a:Int, b: Int) -> Int in
    return a * b
}
let result = multiply(3, 5)
print(result)


// Closures'ı parametre olarak kullanma:

func operateOnNumbers(a:Int, b: Int, operation: (Int,Int) -> Int) -> Int{
    return operation(a, b)
}

let addition = operateOnNumbers(a: 15, b: 5, operation: {(x, y) in
    return x + y
})
print(addition)

// Trailing closure sözdizimi:

func doSomething(completion: () -> Void){
    // işler yapıldıktan sonra
    completion()
}

doSomething {
    print("İşlem Tamamlandı!")
}
