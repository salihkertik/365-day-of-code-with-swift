//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Salih Kertik on 9.06.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImage = [UIImage]()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        landmarkNames.append("Colosseum")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonhenge")
        landmarkNames.append("Taj Mahal")
        
        landmarkImage.append(UIImage(named: "collesium")!)
        landmarkImage.append(UIImage(named: "greatWall")!)
        landmarkImage.append(UIImage(named: "kremlin")!)
        landmarkImage.append(UIImage(named: "stonehenge")!)
        landmarkImage.append(UIImage(named: "tajMahal")!)
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // landmarkNames'in içinde ne kadar veri varsa onu göster diyoruz.
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        //landmarNames indexpath.row dersek sırasıyla hangisine eşitse onu getiriyor. [0] dersek Colosseum u getirir hepsine.
        content.text = landmarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    
    
    
}
