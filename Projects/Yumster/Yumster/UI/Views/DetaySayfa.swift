//
//  DetaySayfa.swift
//  Yumster
//
//  Created by Salih Kertik on 11.10.2023.
//

import UIKit
import Kingfisher

class DetaySayfa: UIViewController {
    
    
    @IBOutlet weak var labelYemek: UILabel!
    
    
    @IBOutlet weak var labelUrunSayac: UILabel!
    @IBOutlet weak var labelToplamFiyat: UILabel!
    
    @IBOutlet weak var labelFiyat: UILabel!
    @IBOutlet weak var imageViewYemek: UIImageView!
    
    @IBOutlet weak var labelBilgiTwo: UILabel!
    @IBOutlet weak var labelBilgiOne: UILabel!
    @IBOutlet weak var labelBilgiThree: UILabel!
    
    var yemek:Yemekler?
    var sepetYemekler:SepetYemekler?
    
    var viewModel = DetayViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let y = yemek, let fiyatString = y.yemek_fiyat {
            labelFiyat.text = "\(fiyatString) ₺"
            labelToplamFiyat.text = "\(fiyatString) ₺"
            
        }
        
        if let y = sepetYemekler {
            labelYemek.text = y.yemek_adi
            labelFiyat.text = y.yemek_fiyat
            
            
            if let yemekResimAdi = y.yemek_resim_adi, let image = UIImage(named: yemekResimAdi){
                imageViewYemek.image = image
            }else{
                imageViewYemek.image = UIImage(named: "su")
            }
        }
        
        if let y = yemek {
            labelYemek.text = y.yemek_resim_adi
            
            if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(y.yemek_resim_adi!)"){
                DispatchQueue.main.async {
                    self.imageViewYemek.kf.setImage(with: url)
                    
                    if let yemek_adi = self.labelYemek.text, yemek_adi.count >= 4 {
                        let endIndex = yemek_adi.index(yemek_adi.endIndex, offsetBy: -4)
                        let truncatedText = yemek_adi[..<endIndex]
                        let firstChar = truncatedText.prefix(1).uppercased()
                        let restOfText = truncatedText.dropFirst()
                        let formattedText = firstChar + restOfText
                        self.labelYemek.text = String(formattedText)
                    }
                }
            }
            //labelFiyat.text = "\(y.yemek_fiyat!) ₺"
            //labelToplamFiyat.text = "\(y.yemek_fiyat!) ₺"
            
        }
        
        let labelsToRound: [UILabel] = [labelToplamFiyat, labelBilgiOne, labelBilgiTwo, labelBilgiThree, labelUrunSayac]
        for label in labelsToRound {
            label.layer.cornerRadius = 15
            label.layer.masksToBounds = true
        }
    }
    
    var urunAdeti = 1
    var urunSayac = 0
    var urunFiyati = 1
    @IBAction func buttonPlus(_ sender: Any) {
        urunSayac += 1
        urunAdeti += 1
        updateLabel()
        hesaplaVeGuncelle()
    }
    @IBAction func buttonMinus(_ sender: Any) {
        if urunSayac > 0 {
            urunSayac -= 1
            urunAdeti -= 1
            updateLabel()
            hesaplaVeGuncelle()
        }
    }
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        if let ya = labelYemek.text, let yi = imageViewYemek.image, let yad = labelUrunSayac.text {
            if let imageData = yi.pngData() {
                let base64Image = imageData.base64EncodedString()
                viewModel.sepeteYemekEkle(yemek_adi: ya, yemek_resim_adi: base64Image, yemek_fiyat: urunFiyati, yemek_siparis_adet: Int(yad) ?? 1, kullanici_adi: "salih_kertik")
            }
            print("sepete eklendi")
        }
    }
    
    func updateLabel() {
        labelUrunSayac.text = "\(urunSayac)"
    }
    
    func hesaplaVeGuncelle() {
        
        if let yemek = yemek, let fiyatString = yemek.yemek_fiyat, let fiyat = Int(fiyatString) {
            let toplamFiyat = fiyat * urunAdeti
            
            if urunAdeti == 1 {
                labelToplamFiyat.text = "\(fiyat) ₺"
            } else {
                labelToplamFiyat.text = "\(toplamFiyat) ₺"
            }
            
            labelUrunSayac.text = "\(urunAdeti)"
            urunFiyati = toplamFiyat // Ürün fiyatını güncelle
        } else {
            // Hatalı yemek fiyatı veya urunAdeti değeri varsa burada hata işleme yapabilirsiniz.
            // Örneğin:
            print("Hatalı yemek fiyatı veya urunAdeti değeri")
        }
    }
}

