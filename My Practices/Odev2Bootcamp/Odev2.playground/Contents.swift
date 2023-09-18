import UIKit
// KM/Mil Dönüşüm sorusu
class Soru1 {
    func soru1(km:Double) -> Double {
        let mile = km * 0.621
        return mile
    }
}
let s1 = Soru1()
let sonuc = s1.soru1(km: 10)
print("Km'nin Mile'a dönüşen sonucu : \(sonuc)") // çıktı: 6.21
print("-----------------------------------------")


// Dikdörtgen alan hesaplama sorusu
class Soru2 {
    func soru2(Kkenar:Int, UKenar:Int){
        let alan = Kkenar * UKenar
        print("Dikdörtgenin alan hesabının sonucu : \(alan)")
    }
}
let s2 = Soru2()
s2.soru2(Kkenar: 5, UKenar: 8)

print("-----------------------------------------")

// Faktoriyel hesaplama sorusu
class Soru3 {
    func faktoriyelHesapla(n:Int) -> Int {
        if n == 0 || n == 1 {
            return 1
        }else {
            return n * faktoriyelHesapla(n: n-1)
        }
    }
}
let faktoriyel = Soru3()
let sonucc = faktoriyel.faktoriyelHesapla(n: 4)
print("\(sonucc)")

print("-----------------------------------------")

//Girilen kelimede kaç tane e harfi olduğunu gösteren metod sorusu

class Soru4 {
    func harfSay(kelime:String){
        var sayac = 0
        for karakter in kelime {
            if karakter == "e" || karakter == "E" {
                sayac += 1
            }
        }
        print("Girdiğiniz kelimede toplam \(sayac) tane e/E harfi vardır.")
    }
    
}
let adet = Soru4()
adet.harfSay(kelime: "Edirne")

print("-----------------------------------------")

// Parametre olarak girilen kenar sayısına göre her bir iç açıyı hesaplayıp sonucu geri gönderen metod yazınız.
class Soru5 {
    func icAciToplami(kenarSayisi: Int) -> Double {
        let toplam = Double((kenarSayisi - 2) * 180) / Double(kenarSayisi)
        return toplam
    }
}
// Üçgen hesaplamak için 3, dörgen için 4, çokgen için kaç kenarlıysa o sayıyı yazmamız yeterli

let s5 = Soru5().icAciToplami(kenarSayisi: 3)
print("Üçgenin her bir iç açısının derecesi: \(s5), Üçgenin iç açılarının toplamı ise : \(s5*3)")
print("-----------------------------------------")


// 18 gün = 18*8 144 saat çalışmış demek
// 19 gün = 19*8 152 saat çalışmış demek (mesai ücretine girer)
// 18 ve altıysa 40₺, 19 ve üstü ise 80₺
// kullanıcıdan kaç gün çalıştığını öğrenmek için soruyoruz ve 10 gün çalıştığını belirtiyor. if kontrolünde 18 günden düşük olduğu için normal ücret yani saatliği 40₺ ücrete denk geldiği için ilk if kontrolümüz cevabı veriyor.
// eğer 19 günden fazla çalışmış olsaydı ve örneği 23 gün yazsaydı, else if kontrolümüze girip saatlik ücretini 80₺ den hesap görülecekti.
class Soru6 {
    var x = 0
    func gun(kacGun:Int){
        if x <= 18 {
            x = Int(kacGun*8)*40
        }
        else if x >= 19 {
            x = Int(kacGun*8)*80
        }
        print(x)
    }
}
var x = Soru6()
x.gun(kacGun: 10)
print("-----------------------------------------")


class Soru7 {
    func otoparkUcretiHesapla(sure: Int) -> Int {
        let ilkSaat = 50
        let ekSaat = 10
        
        if sure <= 0 {
            return 0
        }
        else if sure <= 60 {
            return ilkSaat
        }
        else if sure > 60 {
            let saatlikUcret = ilkSaat + (sure / 60 - 1) * ekSaat
            return saatlikUcret
        }else {
            return 0
        }
    }
}
let ucretHesaplama = Soru7()
let ucret = ucretHesaplama.otoparkUcretiHesapla(sure: 100)// örneğin 120 dakkika durduk diyelim
print(ucret)
