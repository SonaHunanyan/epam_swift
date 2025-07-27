//
//  ViewController.swift
//  Storage3
//
//  Created by Sona Hunanyan on 28.07.25.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource {
    
    private let searchTextField = UITextField()
    private let saveButton = UIButton(type: .system)
    private let tableView = UITableView()
    private var recentSearches: [String] = []
    private let maxCount = 5
    private let cellIdentifier = "resultCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        load()
    }
    
    private func setup() {
        searchTextField.placeholder = "Search"
        searchTextField.borderStyle = .roundedRect
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitle("Search", for: .normal)
        saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchTextField)
        view.addSubview(saveButton)
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchTextField.trailingAnchor.constraint(equalTo: saveButton.leadingAnchor, constant: -8),
            saveButton.centerYAnchor.constraint(equalTo: searchTextField.centerYAnchor),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            saveButton.widthAnchor.constraint(equalToConstant: 80),
            tableView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func load() {
        recentSearches = RecentSearchStore.instance.get()
        tableView.reloadData()
    }
    
    @objc private func save() {
        guard let text = searchTextField.text else {
            return
        }
        if text.isEmpty {
            return
        }
        recentSearches.insert(text, at: 0)
        if recentSearches.count > maxCount {
            recentSearches = Array(recentSearches.prefix(maxCount))
        }
        RecentSearchStore.instance.store(recentSearches)
        searchTextField.text = ""
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentSearches.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = recentSearches[indexPath.row]
        return cell
    }
}
