import UIKit

// Ders 3 - Access Control, Static Properties, and Laziness:

// Bir yapı içindeki özelliklere ve metodlara nasıl erişileceğini kontrol etmeyi (access control), static özellikleri ve metodları nasıl kullanmayı ve lazy özellikleri nasıl kullanmayı öğreneceğiz.

// * Erişim Kontrolü (Access Control):
// Erişim kontrolü, bir özelliğin veya metodun hangi kod parçalarından erişilebileceğini belirler. Bu, kodun güvenliği ve organizasyonu açısından önemlidir.

struct Person{
    private var ssn: String // Özel (private) erişim seviyesi
    
    init(ssn: String){
        self.ssn = ssn
    }
}


// * Statik Özellikler ve Metodlar (Static Properties and Methods):

// 'static' anahtar kelimesi kullanılarak oluşturulan statik özellikler ve metodlar, bir yapı veya sınıf türünden bağımsız olarak kullanılabilir.

struct MatHelper{
    static func square(_ number: Int) -> Int {
        return number * number
    }
}

let squaredValue = MatHelper.square(5) // 25

// * Lazy Özellikler (Lazy Properties):

// Bir özelliği, ona ilk erişildiğinde değil, ihtiyaç olduğunda oluşturmak için kullanılır. Bu, kaynak yoğun işlemleri geciktirmenize yardımcı olabilir.

struct ImageProcessor {
    lazy var loadImage: UIImage = {
        // Resim yükleme işlemi
        // ...
        return loadImage
    }()
}

var processor = ImageProcessor()
// loadImage henüz yüklenmemiş, burdan yüklenecek
let image = processor.loadImage

//  Özelliklere ve metodlara nasıl erişeceğinizi kontrol etmek için erişim kontrolünü, türden bağımsız özellikler ve metodlar için static kullanımını, ve ihtiyaç duyulduğunda özellikleri yaratmak için lazy kullanımını öğrendik.
