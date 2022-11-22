//
//  ViewController.swift
//  SevenDays
//
//  Created by Giuliano Accorsi on 21/11/22.
//

import UIKit

protocol MovieViewControllerDisplayable: AnyObject {
    func displayMovies(movies: [Movie])
}

final class MovieViewController: UIViewController {

    private let movieView: MovieView
    private let viewModel: MovieViewModel

    init(
        moviesView: MovieView,
        viewModel: MovieViewModel
    ) {
        self.movieView = moviesView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        super.loadView()
        view = movieView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadRunningMatches()
    }
}

extension MovieViewController: MovieViewControllerDisplayable {
    func displayMovies(movies: [Movie]) {
        movieView.updateMovies(movies)
    }
}
