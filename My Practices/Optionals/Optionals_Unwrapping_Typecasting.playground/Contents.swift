import UIKit

// * Optionals, Unwrapping, and Typecasting:

// Opsiyonel Veri Türü (Optional Data Type):

// Opsiyonel, bir değerin ya var olabileceğini ya da hiç olmayabileceğini ifade eder. Bir değerin opsiyonel olduğunu belirtmek için '?' sembolünü kullanırız.


var name: String?

// Opsiyonel Değerleri Çıkarma (Unwrapping Optionals):

// Opsiyonel değeri çıkarmak için güvenli yollar vardır. if let, guard let, veya nil coalescing ('??') gibi yöntemleri kullanabilirsiniz.
if let unwrappedName = name {
    print("Ad: \(unwrappedName)")
}else {
    print("Ad bilgisi yok")
}

// Zorunlu (Force) Çıkarma (Force Unwrapping):

// Eğer emin olduğunuz bir durumda opsiyonel bir değeri çıkarmak isterseniz, ! sembolünü kullanabilirsiniz. Ancak bu yöntem risklidir ve nil olduğunda hata verebilir.

// Example:  let unwrappedAge = age!

// Dolaylı (Implicit) Çıkarma (Implicitly Unwrapped Optionals):

// Değişkeni tanımlarken ! sembolü kullanarak, o değişkeni kullanırken her seferinde çıkarmadan erişebilirsiniz.

var phoneNumber: String!
phoneNumber = "123-456-7890"
print(phoneNumber) // çıkarmaya gerek yok


// Nil Coalescing:

// Nil coalescing operatörü ??, opsiyonel bir değeri kontrol eder ve nil ise verilen bir varsayılan değeri döndürür.

let username = usernameFromDatabase ?? "Misafir"

// Opsiyonel Zincirleme (Optional Chaining):

// Opsiyonel zincirleme, bir opsiyonel değerin üzerinde ardışık olarak işlem yapma yeteneğidir.

let uppercaseName = person?.name?.uppercased()

// Tip Dönüşümü (Typecasting):

// Farklı sınıf ve türler arasında tip dönüşümü yapabilirsiniz. as? ve as! operatörleri kullanılır.

if let dog = animal as? Dog {
    dog.bark()
}

// Hayvan sınıfı tanımı
class Animal {
    func makeSound() {
        print("Hayvan sesi")
    }
}

// Köpek sınıfı, Hayvan sınıfından türetiliyor
class Dog: Animal {
    func bark() {
        print("Hav hav!")
    }
}

// Kedi sınıfı, Hayvan sınıfından türetiliyor
class Cat: Animal {
    func meow() {
        print("Miyav!")
    }
}

// Animal türünde bir nesne oluşturuluyor
let animal: Animal = Dog()

// Eğer animal nesnesi Dog türüne dönüştürülebilirse
if let dog = animal as? Dog {
    dog.bark() // Hav hav!
} else {
    print("Bu nesne bir köpek değil.")
}

// Bu örnekte, Animal adında genel bir sınıfımız var. Bu sınıfın altında Dog (Köpek) ve Cat (Kedi) adında alt sınıflar bulunuyor. Dog sınıfı bark() metoduna sahipken, Cat sınıfı meow() metoduna sahiptir.

// Sonrasında animal adında bir nesne oluşturuyoruz ve bu nesneyi Dog türüne dönüştürmeye çalışıyoruz. Eğer dönüşüm başarılı olursa (animal gerçekten bir köpek ise), dog.bark() ile köpeğin havlaması çağrılır. Aksi takdirde, "Bu nesne bir köpek değil." mesajı yazdırılır.
