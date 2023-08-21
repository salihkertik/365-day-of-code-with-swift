import UIKit

// * Protokoller (Protocols)

// Bir protokol, belirli bir işlevselliği veya özelliği tanımlayan bir yapılardır. Protokoller, belli bir yöntem veya özellik setini uygulamak zorunda olan türler (types) için bir kılavuz görevi görür.


protocol CanFly{
    func fly()
}

// Protokol Uygulaması (Conforming to Protocols)

// Bir tür (type), belirli bir protokolü uygulayarak o protokoldeki yöntemleri ve özellikleri sağlayabilir.


class Bird: CanFly {
    func fly(){
        print("Kuş Uçuyor!")
    }
}

// Uzantılar (Extensions):

// Uzantılar, mevcut bir türe yeni özellikler veya yöntemler eklemek için kullanılır. Bu, daha önce tanımlanmış bir türe yeni yetenekler eklemek için kullanışlıdır.


extension Int {
    func square() -> Int{
        return self * self
    }
}

let number = 5
print(number.square()) // 25

// * Protokol Uzantıları (Protocol Extensions):

// Protokol uzantıları, protokollere ekstra özellikler veya varsayılan uygulamalar eklemek için kullanılır. Bu, bir protokolu uygulayan tüm türler için ortak işlevselliği sağlar.

extension CanFly {
    func fly() {
        print("Uçabilir!")
    }
}
