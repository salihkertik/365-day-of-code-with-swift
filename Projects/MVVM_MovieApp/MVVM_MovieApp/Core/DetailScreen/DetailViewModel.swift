//
//  DetailViewModel.swift
//  MVVM_MovieApp
//
//  Created by Salih Kertik on 29.08.2023.
//

import Foundation

protocol DetailViewModelInterface {
    var view: DetailScreenInterface? { get set }
    
    func viewDidLoad()
}

final class DetailViewModel {
    weak var view: DetailScreenInterface?
}

extension DetailViewModel: DetailViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configurePosterImageView()
        view?.downloadPosterImage()
        view?.configureTitleLabel()
        view?.configureDateLabel()
        view?.configureOverviewLabel()
    }
}
