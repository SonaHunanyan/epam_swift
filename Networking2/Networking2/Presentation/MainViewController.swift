//
//  ViewController.swift
//  Networking2
//
//  Created by Sona Hunanyan on 16.07.25.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource {
    private var shows: [TVShow] = []
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        prepare()
    }
    
    private func prepare() {
        TVShowsRepository.getTVShows { result in
            DispatchQueue.main.sync {
                switch result{
                case .success(let data):
                    self.shows = data
                    self.tableView.reloadData()
                case .failure(let error):
                    self.showError(error)
                }
            }
        }
    }
    
    private func showError(_ error: TVError){
        let alert = UIAlertController(title: "Error", message: "\(error)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    private func setup(){
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(TVShowCell.self, forCellReuseIdentifier: TVShowCell.identifier)
        tableView.rowHeight = 136
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TVShowCell.identifier, for: indexPath) as? TVShowCell else {
            return UITableViewCell()
        }
        cell.configure(with: shows[indexPath.row])
        return cell
    }
}

