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

class Soru6 {
    func hesaplaMaas(gunSayisi: Int) -> Double {
        let calismaSaatleri = gunSayisi * 8
        let normalSaatUcreti: Double = 40
        let mesaiSaatUcreti: Double = 80
        let mesaiSiniri: Int = 150
        let normalMaas = Double(calismaSaatleri) * normalSaatUcreti
        
        var mesaiSaatleri = 0
        // Burada girilen değeri kontrol ediyoruz. calısmaSaatleri büyükse mesaiSiniri (150 saat) calismaSaatleri değişkeninden mesaiSiniri nı çıkarıyoruz.
        // sonuç olarak elimize 150 saatin üstüne çıkıp ekstra kaç saat çalıştığını buluyoruz.
        if calismaSaatleri > mesaiSiniri {
            mesaiSaatleri = calismaSaatleri - mesaiSiniri
        }
        // ekstra kaç saat çalıştığını bulduktan sonra mesaiSaatUcreti (80₺) ile çarpıp mesaiMaasi değişkenine atıyoruz.
        let mesaiMaasi = Double(mesaiSaatleri) * mesaiSaatUcreti
        // son olarak normal maas ile mesai saat ücretini toplayıp return ediyoruz.
        let toplamMaas = normalMaas + mesaiMaasi
        
        return toplamMaas
    }
}
let maas = Soru6()
var sonuc = maas.hesaplaMaas(gunSayisi: 10) // Çıktısı: 3200.0₺
print("Toplam maaş: \(sonuc) ₺")

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
