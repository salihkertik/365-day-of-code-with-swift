import UIKit

// * Classes and Inheritance

// Bir sınıfın nasıl oluşturulacağını, sınıflar arasında nasıl kalıtım yapılabileceğini ve kalıtımın nasıl kullanıldığını içeren notlarım.

// Kendi Sınıflarınızı Oluşturma (Creating Your Own Classes):

// Bir sınıf, bir yapıya benzer şekilde veri ve metodları içerebilen bir veri tipidir. Bir sınıf oluşturarak, kendi veri tipinizi oluşturabilirsiniz.


class Dog {
    var name: String
    var age: Int
    
    init(name: String, age:Int){
        self.name = name
        self.age = age
        
      
    }
    
    // Kopya inisiyalizatörü
    init(copyFrom otherDog: Dog) {
        self.name = otherDog.name
        self.age = otherDog.age
    }
    
    
    func bark(){
        
    }
}

// * Sınıf Kalıtımı (Class Inheritance):

// Bir sınıfın diğer bir sınıftan türetilmesi olarak adlandırılan kalıtım, mevcut sınıfın özelliklerini ve metodlarını başka bir sınıfa miras olarak verir.

class Puppy: Dog{
    func play() {
        print("\(name) oynuyor!")
    }
}

// * Metodları Geçersiz Kılma (Overriding Methods):

// Alt sınıflar (subclass), üst sınıflardaki (superclass) metodları geçersiz kılabilirler. Böylece aynı adı taşıyan farklı davranışlar tanımlayabilirler.


class OldDog: Dog {
    override func bark(){
        print("\(name) kısırdı ama hala havlıyor!")
    }
}

// * Nihai Sınıflar (Final Classes):

// Bir sınıfı kalıtımın sonlandırılması için final anahtar kelimesi ile işaretleyebilirsiniz. Böylece bu sınıftan başka bir sınıf türetilemez.

final class FinalDog: Dog {
    // Bu sınıfı türeten başka bir sınıf olamaz.
}

// * Nesneleri Kopyalama (Copying Objects):

// Bir nesnenin kopyasını almak için copy metodu veya NSCopying protokolünü kullanabilirsiniz.


let originalDog = Dog(name: "Buddy", age: 3)
let copiedDog = Dog(copyFrom: originalDog)

// Nesne kopyalama ile alakalı daha iyi bir örnnek:


// Diyelim ki bir 'Person' sınıfımız var ve bu sınıfın özellikleri "name" ve "age". Bu sınıftan örnekler oluşturarak nesne kopyalama işlemini yapabiliriz.

class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    func copy() -> Person {
        return Person(name: name, age: age)
    }
    
}

let originalPerson = Person(name: "Ahmet", age: 30)
let copiedPerson = originalPerson.copy()

print("Orijinal kişi: \(originalPerson.name), \(originalPerson.age) yaşında")
print("Kopya kişi: \(copiedPerson.name), \(copiedPerson.age) yaşında ")
