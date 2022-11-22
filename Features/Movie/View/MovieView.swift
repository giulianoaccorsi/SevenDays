//
//  MovieView.swift
//  SevenDays
//
//  Created by Giuliano Accorsi on 21/11/22.
//

import UIKit

final class MovieView: UIView {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false

        return tableView
    }()

    private lazy var titleView: UILabel = {
        let label = UILabel()
        label.text = "Filmes Populares"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 28)
        label.textAlignment = .center
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.87)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private var dataSource = MovieDataSource()

    init() {
        super.init(frame: .zero)
        setUpView()
        dataSource.delegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        addBlur()
    }

    func updateMovies(_ movies: [Movie]) {
        dataSource.movies = movies
    }

    private func addBlur() {
        let gradientView = GradientViewApp()
        gradientView.frame = bounds
        gradientView.firstColor = UIColor(red: 0.18, green: 0.075, blue: 0.443, alpha: 1.0)
        gradientView.secondColor = UIColor(red: 0.075, green: 0.043, blue: 0.169, alpha: 1.0)
        gradientView.colorRatio = 0.80
        gradientView.fadeIntensity = 1

        insertSubview(gradientView, at: 0)
    }
}

extension MovieView: ViewConfiguration {
    func buildViewHierarchy() {
        addSubview(titleView)
        addSubview(tableView)
    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: topAnchor, constant: 87),
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 86),
            titleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -87),

            tableView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 32.0),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func setUpAdditionalConfiguration() {
        dataSource.setupTableView(tableView: tableView)
        backgroundColor = .blue
    }
}

extension MovieView: MovieDataSourceDelegate {
    func didTappedMatch() {
        //
    }

    func loadMoreData() {
        //
    }
}
