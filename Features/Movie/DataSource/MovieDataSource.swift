//
//  MovieDataSource.swift
//  SevenDays
//
//  Created by Giuliano Accorsi on 21/11/22.
//

import UIKit

protocol MovieDataSourceDelegate: AnyObject {
    func didTappedMatch()
    func loadMoreData()
}

final class MovieDataSource: NSObject {
    var movies: [Movie] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }

    private var tableView: UITableView?
    weak var delegate: MovieDataSourceDelegate?

    func setupTableView(tableView: UITableView) {
        self.tableView = tableView
        registerCell()
        setupDataSource()
    }

    private func registerCell() {
        self.tableView?.register(MovieCell.self, forCellReuseIdentifier: MovieCell.description())
    }

    private func setupDataSource() {
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
    }
}

extension MovieDataSource: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MovieCell = tableView.dequeueReusableCell(withIdentifier: MovieCell.description(), for: indexPath) as? MovieCell else { return UITableViewCell() }
        cell.configure(with: MovieCellViewModel(movie: movies[indexPath.row]))
        return cell
    }
}

