//
//  MovieViewModel.swift
//  SevenDays
//
//  Created by Giuliano Accorsi on 21/11/22.
//

import Foundation


final class MovieViewModel {
    weak var display: MovieViewControllerDisplayable?

    func loadRunningMatches() {
        display?.displayMovies(movies: [
            Movie(id: 1, title: "Órfã 2: A Origem", overview: "", releaseDate: "2022-07-27", posterPath: nil, voteAverage: 7.2),
            Movie(id: 2, title: "Minions 2: A Origem de Gru", overview: "", releaseDate: "2022-06-29", posterPath: nil, voteAverage: 7.8),
            Movie(id: 3, title: "Thor: Amor e Trovão", overview: "", releaseDate: "2022-07-06", posterPath: nil, voteAverage: 6.8),
            Movie(id: 4, title: "Avatar", overview: "", releaseDate: "2009-12-18", posterPath: nil, voteAverage: 8.8)
        ])
    }
}
