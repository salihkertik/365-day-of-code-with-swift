//
//  SepetVC.swift
//  Yumster
//
//  Created by Salih Kertik on 11.10.2023.
//

import UIKit
import Kingfisher

class SepetVC: UIViewController {
    var sepetHucreler: [SepetHucre] = []
    
    
    @IBOutlet weak var labelToplamYemekFiyat: UILabel!
    @IBOutlet weak var sepettekiYemeklerTableView: UITableView!
    
    var viewModel = SepetVCViewModel()
    var yemeklerListesiTwo = [SepetYemekler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sepettekiYemeklerTableView.delegate = self
        sepettekiYemeklerTableView.dataSource = self
        
        _ = viewModel.yemeklerListesiTwo.subscribe(onNext: { liste in
            self.yemeklerListesiTwo = liste
            DispatchQueue.main.async {
                self.sepettekiYemeklerTableView.reloadData()
                self.hesaplaVeGuncelleToplamFiyat()
            }
        })
        
        self.navigationItem.title = "Yumster"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "a")
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "yaziRenk1")!,.font: UIFont(name: "Pacifico-Regular", size: 26)!]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool){
        //viewModel.sepeteYemekEkle()
        viewModel.sepettekiYemekleriGetir(kullanici_adi: "salih_kertik")
        
    }
    
    @IBAction func sepetiOnayla(_ sender: Any) {
        showOrderConfirmation()
        
    }
    func showOrderConfirmation() {
        let alertController = UIAlertController(title: "Siparişin Onaylandı ✅", message: "Siparişiniz başarıyla onaylandı 🥳", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Tamam", style: .default) { (action) in
            // Tamam düğmesine basıldığında bu blok çalışır
            alertController.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}


extension SepetVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemeklerListesiTwo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = yemeklerListesiTwo[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "sepetHucre") as! SepetHucre
        
        hucre.labelYemekAdi.text = yemek.yemek_adi
        hucre.labelAdet.text = "Adet: \(yemek.yemek_siparis_adet!)"
        hucre.labelYemekFiyat.text = "Fiyat: \(yemek.yemek_fiyat!) ₺"
        
        // Hesaplamaları yap ve toplam fiyatı hesapla
        if let adetString = yemek.yemek_siparis_adet, let fiyatString = yemek.yemek_fiyat, let adet = Int(adetString), let fiyat = Int(fiyatString) {
            let toplamFiyat = adet * (fiyat/adet)
            hucre.labelYemekFiyat.text = "Fiyat: \(fiyat/adet) ₺"
            hucre.labelToplamYemekFiyat.text = "\(toplamFiyat) ₺"
        }
        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_adi!.lowercased()).png") {
            DispatchQueue.main.async {
                hucre.imageViewYemek.kf.setImage(with: url)
            }
        }
        
        return hucre
    }
    
    func hesaplaVeGuncelleToplamFiyat() {
        var toplamFiyat: Int = 0
        
        for yemek in yemeklerListesiTwo {
            if let adetString = yemek.yemek_siparis_adet, let fiyatString = yemek.yemek_fiyat, let adet = Int(adetString), let fiyat = Int(fiyatString) {
                let urunFiyati = adet * (fiyat/adet)
                toplamFiyat += urunFiyati
            }
        }
        
        // Sonuç olarak, toplamFiyat değişkeni tüm ürünlerin toplam fiyatını içerecektir.
        labelToplamYemekFiyat.text = "\(toplamFiyat) ₺"
    }
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { contextualAction, view, bool in
            
            let yemek = self.yemeklerListesiTwo[indexPath.row]
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yemek.yemek_adi!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){action in
                self.viewModel.sepettenYemekSil(sepet_yemek_id: yemek.sepet_yemek_id!, kullanici_adi: yemek.kullanici_adi)
                
                
                self.yemeklerListesiTwo.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                self.hesaplaVeGuncelleToplamFiyat()
            }
            alert.addAction(evetAction)
            self.present(alert,animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
