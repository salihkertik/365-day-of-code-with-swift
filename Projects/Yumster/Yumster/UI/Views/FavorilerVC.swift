//
//  FavorilerVC.swift
//  Yumster
//
//  Created by Salih Kertik on 11.10.2023.
//

import UIKit

class FavorilerVC: UIViewController {
    
    @IBOutlet weak var favorilerCollectionView: UICollectionView!
    
    var favorilerListesi = [Favoriler]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favorilerCollectionView.delegate = self
        favorilerCollectionView.dataSource = self
        
        
        
        let f3 = Favoriler(id: 3, ad: "Fanta", resim: "fanta")
        let f8 = Favoriler(id: 8, ad: "Köfte", resim: "kofte")
        let f10 = Favoriler(id: 10, ad: "Makarna", resim: "makarna")
        let f11 = Favoriler(id: 11, ad: "Pizza", resim: "pizza")
        let f14 = Favoriler(id: 14, ad: "Tiramisu", resim: "tiramisu")
        
        favorilerListesi.append(f3)
        favorilerListesi.append(f10)
        favorilerListesi.append(f11)
        favorilerListesi.append(f14)
        favorilerListesi.append(f8)
        
        
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumLineSpacing = 10
        tasarim.minimumInteritemSpacing = 10
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 30) / 2
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik*1.6)
        favorilerCollectionView.collectionViewLayout = tasarim
        
        //Tasarım kodlaması
        let appearance = UINavigationBarAppearance()
        self.navigationItem.title = "Yumster"
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "yaziRenk1")!,.font: UIFont(name: "Pacifico-Regular", size: 26)!]
        appearance.backgroundColor = UIColor(named: "a")
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
    
    
    @IBAction func favorilerdenKaldırButton(_ sender: Any) {
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        favorilerCollectionView.reloadData()
    }
}

extension FavorilerVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorilerListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let favori = favorilerListesi[indexPath.row]
        
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "favorilerHucre", for: indexPath) as! FavorilerHucre
        hucre.imageViewFavori.image = UIImage(named: favori.resim!)
        hucre.labelFavoriName.text = "\(favori.ad!)"
        
        hucre.layer.borderColor = UIColor.a.cgColor
        hucre.layer.borderWidth = 1.8
        hucre.layer.cornerRadius = 10.0
        hucre.layer.borderColor = UIColor.a.cgColor
        hucre.layer.borderWidth = 3
        hucre.layer.cornerRadius = 10.0
        
        return hucre
    }
}
