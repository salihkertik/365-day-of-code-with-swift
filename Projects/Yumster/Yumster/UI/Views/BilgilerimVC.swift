//
//  BilgilerimVC.swift
//  Yumster
//
//  Created by Salih Kertik on 11.10.2023.
//

import UIKit

class BilgilerimVC: UIViewController {

    @IBOutlet weak var bilgilerTableView: UITableView!
    
    
    var bilgilerListesi = [Bilgiler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bilgilerTableView.delegate = self
        bilgilerTableView.dataSource = self
        
        let b1 = Bilgiler(bilgi: "💬 salihkertik1453@gmail.com")
        let b2 = Bilgiler(bilgi: "📱 +90 (501) 234-5678")
        let b3 = Bilgiler(bilgi: "🔥 Yumster Time")
        let b4 = Bilgiler(bilgi: "🧭 Adreslerim")
        let b5 = Bilgiler(bilgi: "🤩 Favori Restoranlarım")
        let b6 = Bilgiler(bilgi: "⏰ Geçmiş Siparişlerim")
        let b7 = Bilgiler(bilgi: "💳 Ödeme Yöntemlerim")
        let b8 = Bilgiler(bilgi: "☎️ İletişim Tercihlerim")
        let b9 = Bilgiler(bilgi: "⚙️ Hesap Ayarları")
        let b10 = Bilgiler(bilgi: "👩🏼‍💻 Canlı Destek")
        let b11 = Bilgiler(bilgi: "❓ Yardım")
        let b12 = Bilgiler(bilgi: "🚪 Çıkış Yap")

        bilgilerListesi.append(b1)
        bilgilerListesi.append(b2)
        bilgilerListesi.append(b3)
        bilgilerListesi.append(b4)
        bilgilerListesi.append(b5)
        bilgilerListesi.append(b6)
        bilgilerListesi.append(b7)
        bilgilerListesi.append(b8)
        bilgilerListesi.append(b9)
        bilgilerListesi.append(b10)
        bilgilerListesi.append(b11)
        bilgilerListesi.append(b12)
        

        self.navigationItem.title = "Yumster"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "a")
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "yaziRenk1")!,.font: UIFont(name: "Pacifico-Regular", size: 26)!]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    


}
extension BilgilerimVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bilgilerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bilgilerim = bilgilerListesi[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "bilgilerHucre") as! BilgilerHucre
        hucre.labelBilgi.text = bilgilerim.bilgi
        return hucre
    }
    
}
