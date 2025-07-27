//
//  ViewController.swift
//  ApplicationBundle3
//
//  Created by Sona Hunanyan on 27.07.25.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource {
    private var members: [FamilyMember] = []
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        title = "The Simpsons"
        view.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.register(FamilyMemberCell.self, forCellReuseIdentifier: FamilyMemberCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        let items = FamilyMemberRepository.instance.loadFamily()
        if let items = items {
            self.members = items
            tableView.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FamilyMemberCell.identifier, for: indexPath) as? FamilyMemberCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: members[indexPath.row])
        return cell
    }
}

