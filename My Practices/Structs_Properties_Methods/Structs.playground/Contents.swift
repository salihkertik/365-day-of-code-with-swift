import UIKit

// * Ders 2 - Structs, Properties, and Methods:

// Bu ders, verileri saklamak ve bu veriler üzerinde işlemler yapmak için nasıl kendi yapılarınızı oluşturabileceğinizi ve bu yapılar içinde nasıl özellikler ve işlevler tanımlayabileceğinizi öğretiyor.

// * Kendi yapılarınızı oluşturma (Structs):
//Bir yapı (struct), farklı veri tiplerini bir araya getirerek kendi veri türünüzü oluşturmanızı sağlar.


struct Person{
    var name: String
    var age: Int
}

var personel = Person(name: "Salih", age: 23)
print(personel.name, personel.age)

// * Hesaplanan Özellikler (Computed Properties):

// Bir özellik, üzerinde işlemler yapılan veya başka özelliklere dayanan bir değer saklamak için kullanılır.

struct Circle{
    var radius: Double
    
    var area: Double{
        return Double.pi * radius * radius
    }
}

let circle = Circle(radius: 5)
print(circle.area)


// * Özellik Gözlemcileri (Property Observers):

// Bir özelliğin değeri değiştiğinde otomatik olarak belirli kod bloklarını çalıştırmak için kullanılır.


// NOT: willSet: Bir özelliğin değeri değiştirilmeden önce çalışan kod bloğunu temsil eder. Yani, değer değişmeden önce eski değeri willSet ile yakalayabilirsiniz.

// NOT: didSet: Bir özelliğin değeri değiştirildikten sonra çalışan kod bloğunu temsil eder. Yani, yeni değeri didSet ile yakalayabilirsiniz.


struct Temperature {
    var celcius: Double{
        didSet{
            print("Yeni Sıcaklık Değeri: \(celcius)°C")
        }
    }
}

var temp = Temperature(celcius: 20)
temp.celcius = 25 // Bu, didSet bloğunu tetikler.


// Metodlar:

// Bir struct içinde işlevleri temsil eden fonksiyonlara "Metod" denir.

struct Counter {
    var value: Int
    // mutating anahtar kelimesi struct ve enum içerisinde özellikleri değiştirmek için kullanılan anahtar kelimedir ve normalde değer tipleri olan struct veya enum içinde değişiklik yapmamızı sağlar.
    mutating func increment(){
        value += 1
    }
}

var counter = Counter(value: 0)
counter.increment()
print(counter.value)

// * Dizilerin ve Stringlerin Özellikleri ve Metodları:

// Diziler ve stringler gibi standart veri tipleri de çeşitli özelliklere ve metodlara sahiptir.

var names = ["Ali", "Ayşe", "Mehmet"]
names.append("Zeynep")
print(names.count) // Çıktı: 4

let greeting = "Merhaba"
let uppercasedGreeting = greeting.uppercased()
print(uppercasedGreeting)// Çıktı: MERHABA


// ÖZET: Kendi veri yapılarımızı nasıl oluşturacağımızı, bu yapılar içindeki özellikleri ve metodları nasıl kullanacağımızı anlattım.
