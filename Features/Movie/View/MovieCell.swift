//
//  MovieCell.swift
//  SevenDays
//
//  Created by Giuliano Accorsi on 21/11/22.
//

import UIKit

final class MovieCell: UITableViewCell {
    private let movieName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Bold", size: 16)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.87)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with movie: Movie) {
        movieName.text = movie.title
    }
}

extension MovieCell: ViewConfiguration {
    func buildViewHierarchy() {
        contentView.addSubview(movieName)
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            movieName.topAnchor.constraint(equalTo: topAnchor),
            movieName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
//            movieName.rightAnchor.constraint(equalTo: trailingAnchor, constant: -30),
//            movieName.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func setUpAdditionalConfiguration() {
        backgroundColor = .clear
    }
}
