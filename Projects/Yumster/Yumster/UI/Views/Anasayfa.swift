//
//  ViewController.swift
//  Yumster
//
//  Created by Salih Kertik on 11.10.2023.
//

import UIKit
import Kingfisher


class Anasayfa: UIViewController,UIBarPositioningDelegate{
    
    @IBOutlet weak var yemeklerCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var yemeklerListesi = [Yemekler]()
    
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        yemeklerCollectionView.delegate = self
        yemeklerCollectionView.dataSource = self
        
        _ = viewModel.yemeklerListesi.subscribe(onNext: { liste in
            self.yemeklerListesi = liste
            DispatchQueue.main.async {
                self.yemeklerCollectionView.reloadData()
            }
            
        })
        
        // Görünüm kodları
        searchBar.searchBarStyle = .minimal
        self.navigationItem.title = "Yumster"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "a")
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "yaziRenk1")!,.font: UIFont(name: "Pacifico-Regular", size: 26)!]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        let appearance1 = UITabBarAppearance()
        appearance1.backgroundColor = UIColor.a
        renkDegistir(itemAppearance: appearance1.stackedLayoutAppearance)
        tabBarController?.tabBar.standardAppearance = appearance1
        tabBarController?.tabBar.scrollEdgeAppearance = appearance1
        
        //CollectionView Tasarımı
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 30) / 2
        
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 1.5)
        yemeklerCollectionView.collectionViewLayout = tasarim
    }
    
    
    func renkDegistir(itemAppearance:UITabBarItemAppearance){
        //Seçili Durum
        itemAppearance.selected.iconColor = UIColor.darkGray
        
        //Seçili Olmayan Durum
        itemAppearance.normal.iconColor = UIColor.white
    }
    
    @IBAction func plusButton(_ sender: Any) {
        print("plus button Tıklandı")
    }
    
    
    
    @IBAction func favoriButton(_ sender: UIButton) {
        print("favori button Tıklandı")
    }
    
    
}




extension Anasayfa : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
            viewModel.yemekleriYukle()
        }
        viewModel.ara(aramaKelimesi: searchText)
    }
    
}

extension Anasayfa : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yemeklerListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let yemek = yemeklerListesi[indexPath.row]
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "yemeklerHucre", for: indexPath) as! YemeklerHucre
        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)"){
            DispatchQueue.main.async {
                hucre.imageViewYemek.kf.setImage(with: url)
            }
        }
        
        
        hucre.labelisim.text = "\(yemek.yemek_adi!)"
        hucre.labelFiyat.text = "\(yemek.yemek_fiyat!) ₺"
        
        hucre.layer.borderColor = UIColor.a.cgColor
        hucre.layer.borderWidth = 3
        hucre.layer.cornerRadius = 10.0
        
        //hucre.hucreProtocol = self
        hucre.indexPath = indexPath
        
        return hucre
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let yemek = yemeklerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: yemek)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            if let yemek = sender as? Yemekler {
                let gidilecekVC = segue.destination as! DetaySayfa
                gidilecekVC.yemek = yemek
            }
        }
    }
    
    
}


