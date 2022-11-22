//
//  MovieCell.swift
//  SevenDays
//
//  Created by Giuliano Accorsi on 21/11/22.
//

import UIKit

final class MovieCell: UITableViewCell {
    private lazy var posterImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 18
        image.backgroundColor = .red
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    private lazy var movieName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Bold", size: 18)
        label.numberOfLines = 0
        label.textColor = .white.withAlphaComponent(0.87)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var releaseDate: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.textColor = .white.withAlphaComponent(0.75)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [movieName, releaseDate])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with movie: MovieCellViewModel) {
        movieName.text = movie.title
        releaseDate.text = movie.releaseDate
    }
}

extension MovieCell: ViewConfiguration {
    func buildViewHierarchy() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(stackView)
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            posterImageView.heightAnchor.constraint(equalToConstant: 120),
            posterImageView.widthAnchor.constraint(equalToConstant: 90),
            posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            stackView.centerYAnchor.constraint(equalTo: posterImageView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30)
        ])
    }

    func setUpAdditionalConfiguration() {
        backgroundColor = .clear
    }
}
