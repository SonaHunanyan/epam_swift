//
//  FamilyMemberCell.swift
//  ApplicationBundle3
//
//  Created by Sona Hunanyan on 27.07.25.
//

import UIKit


class FamilyMemberCell: UITableViewCell {
    static let identifier = "FamilyMemberCell"
    
    let avatarImageView = UIImageView()
    let nameLabel = UILabel()
    let relationLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    private func setup() {
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.cornerRadius = 25
        
        nameLabel.font = .boldSystemFont(ofSize: 18)
        relationLabel.font = .systemFont(ofSize: 14)
        relationLabel.textColor = .gray
        let labelStack = UIStackView(arrangedSubviews: [nameLabel, relationLabel])
        labelStack.axis = .vertical
        labelStack.spacing = 4
        labelStack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(avatarImageView)
        contentView.addSubview(labelStack)
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            labelStack.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            labelStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            labelStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with member: FamilyMember) {
        nameLabel.text = "\(member.name), Age: \(member.age)"
        relationLabel.text = member.relation
        avatarImageView.image = UIImage(named: member.imageName)
    }
}
