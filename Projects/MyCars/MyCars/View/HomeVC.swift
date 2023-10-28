//
//  HomeVC.swift
//  MyCars
//
//  Created by Salih Kertik on 28.10.2023.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var carsTableView: UITableView!
    
    var carsList = [Cars]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carsTableView.dataSource = self
        carsTableView.delegate = self
        
        let car1 = Cars(id: 1, name: "Audi", year: 2023, image: "audi")
        let car2 = Cars(id: 2, name: "BMW", year: 2021, image: "bmw")
        let car3 = Cars(id: 3, name: "MERCEDES", year: 2024, image: "mercedes")
        carsList.append(car1)
        carsList.append(car2)
        carsList.append(car3)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let car = carsList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "carsCell") as! CarsCell
        
        cell.imageViewCar.image = UIImage(named: car.image!)
        cell.labelCarName.text = car.name
        cell.labelCarYear.text = "\(car.year!)"
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.cellBackground.layer.cornerRadius = 15.0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let car = carsList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: car)
        
    }
    
}
