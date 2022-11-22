//
//  MovieCellViewModel.swift
//  SevenDays
//
//  Created by Giuliano Accorsi on 22/11/22.
//

import Foundation

final class MovieCellViewModel {
    private let movie: Movie

    init(movie: Movie) {
        self.movie = movie
    }

    var title: String {
        movie.title
    }

    var releaseDate: String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        let showDate = inputFormatter.date(from: movie.releaseDate)
        inputFormatter.dateFormat = "dd/MM/yyyy"
        let resultString = inputFormatter.string(from: showDate ?? Date())
        return "Lançamento: \(resultString)"
    }
}
