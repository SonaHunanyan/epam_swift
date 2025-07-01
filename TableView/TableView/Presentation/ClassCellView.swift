//
//  cell_view.swift
//  TableView
//
//  Created by Sona Hunanyan on 01.07.25.
//

import UIKit


protocol ClassCellDelegate: AnyObject {
    func didTapRegisterButton(on cell: ClassCellView)
}

class ClassCellView: UITableViewCell {
    static let reuseID = "ClassCellView"
    weak var delegate: ClassCellDelegate?
    
    
    private let timeLabel = UILabel()
    private let classLabel = UILabel()
    private let durationLabel = UILabel()
    private let trainerImageView = UIImageView()
    private let trainerNameLabel = UILabel()
    private let registerButton = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        timeLabel.font = .boldSystemFont(ofSize: 16)
        timeLabel.textColor = .systemPink
        durationLabel.font = .systemFont(ofSize: 12)
        durationLabel.textColor = .systemPurple
        classLabel.font = .systemFont(ofSize: 16, weight: .regular)
        trainerNameLabel.font = .systemFont(ofSize: 14)
        trainerNameLabel.textColor = .systemPurple
        
        trainerImageView.layer.cornerRadius = 10
        trainerImageView.clipsToBounds = true
        trainerImageView.contentMode = .scaleAspectFill
        
        registerButton.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        
        [timeLabel, classLabel, durationLabel, trainerImageView, trainerNameLabel, registerButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            durationLabel.leadingAnchor.constraint(equalTo: timeLabel.leadingAnchor),
            durationLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 4),
            classLabel.leadingAnchor.constraint(equalTo: timeLabel.trailingAnchor, constant: 20),
            classLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            trainerImageView.leadingAnchor.constraint(equalTo: classLabel.leadingAnchor),
            trainerImageView.topAnchor.constraint(equalTo: classLabel.bottomAnchor, constant: 4),
            trainerImageView.widthAnchor.constraint(equalToConstant: 20),
            trainerImageView.heightAnchor.constraint(equalToConstant: 20),
            trainerNameLabel.leadingAnchor.constraint(equalTo: trainerImageView.trailingAnchor, constant: 8),
            trainerNameLabel.centerYAnchor.constraint(equalTo: trainerImageView.centerYAnchor),
            registerButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 10),
            registerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            registerButton.widthAnchor.constraint(equalToConstant: 35),
            registerButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    @objc private func registerTapped() {
        delegate?.didTapRegisterButton(on: self)
    }
    
    func initialize(gymClass: GymClass) {
        timeLabel.text = gymClass.time
        classLabel.text = gymClass.name
        durationLabel.text = gymClass.duration
        trainerNameLabel.text = gymClass.trainer.fullName
        trainerImageView.image = UIImage(named: gymClass.trainer.photo)
        let imageName = gymClass.isRegistered ? "xmark.circle.fill" : "plus.circle"
        registerButton.setImage(UIImage(systemName: imageName), for: .normal)
        registerButton.tintColor = gymClass.isRegistered ? .systemPink : .black
        registerButton.contentHorizontalAlignment = .fill
        registerButton.contentVerticalAlignment = .fill
    }
}
