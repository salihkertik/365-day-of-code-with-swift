//
//  UICollectionView+Ext.swift
//  MVVM_MovieApp
//
//  Created by Salih Kertik on 29.08.2023.
//

import UIKit

extension UICollectionView {
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
