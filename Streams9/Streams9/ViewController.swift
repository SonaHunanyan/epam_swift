//
//  ViewController.swift
//  Streams9
//
//  Created by Sona Hunanyan on 19.08.25.
//

import UIKit
import Combine


struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class ViewController: UIViewController, UITableViewDataSource {
    private let tableView = UITableView()
    private var posts: [Post] = []
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        getPosts()
    }
    
    private func setup() {
        tableView.frame = view.bounds
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    
    private func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { value in
                value.data
            }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print(error)
                }
            }, receiveValue: { [weak self] posts in
                self?.posts = posts
                self?.tableView.reloadData()
            })
            .store(in: &cancellables)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let post = posts[indexPath.row]
        cell.textLabel?.text = "Title: \(post.title) , Content: \(post.body)"
        return cell
    }
}

