//
//  CarsCell.swift
//  MyCars
//
//  Created by Salih Kertik on 28.10.2023.
//

import UIKit

class CarsCell: UITableViewCell {
    
    @IBOutlet weak var labelCarYear: UILabel!
    @IBOutlet weak var labelCarName: UILabel!
    @IBOutlet weak var imageViewCar: UIImageView!
    @IBOutlet weak var cellBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
