//
//  MovieFactory.swift
//  SevenDays
//
//  Created by Giuliano Accorsi on 21/11/22.
//

import Foundation

enum MovieFactory {
    static func make() -> MovieViewController {
        let matchesView = MovieView()
        let viewModel = MovieViewModel()
        let viewController = MovieViewController(
            moviesView: matchesView,
            viewModel: viewModel
        )
        viewModel.display = viewController

        return viewController
    }
}
