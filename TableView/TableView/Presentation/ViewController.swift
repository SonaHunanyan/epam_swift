//
//  ViewController.swift
//  TableView
//
//  Created by Sona Hunanyan on 01.07.25.
//

import UIKit

class ViewController: UIViewController {
    private var groupedClasses: [Date: [GymClass]] = [:]
    private var dates: [Date] = []
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        prepare()
        render()
    }

    private func prepare() {
        let classes = GymRepository.getClasses()
        let calendar = Calendar.current
        groupedClasses = Dictionary(grouping: classes) { gymClass in
            calendar.startOfDay(for: gymClass.day)
        }
        dates = groupedClasses.keys.sorted()
    }

    private func render() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(ClassCellView.self, forCellReuseIdentifier: ClassCellView.reuseID)
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dates.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let date = dates[section]
        return groupedClasses[date]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let date = dates[indexPath.section]
        guard let gymClass = groupedClasses[date]?[indexPath.row] else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: ClassCellView.reuseID, for: indexPath) as! ClassCellView
        cell.initialize(gymClass: gymClass)
        cell.selectionStyle = .none
        cell.delegate = self
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.systemGroupedBackground
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .label
        let date = dates[section]
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE dd MMM yyyy"
        label.text = formatter.string(from: date)
        headerView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            label.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8)
        ])

        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}

extension ViewController: UITableViewDelegate {}

extension ViewController: ClassCellDelegate {
    func didTapRegisterButton(on cell: ClassCellView) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let date = dates[indexPath.section]
        guard let gymClass = groupedClasses[date]?[indexPath.row] else { return }
        groupedClasses[date]![indexPath.row].isRegistered.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
        let message = gymClass.isRegistered
            ? "You have registered to \(gymClass.name), see you there!"
            : "You have just cancelled \(gymClass.name) :("
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}
