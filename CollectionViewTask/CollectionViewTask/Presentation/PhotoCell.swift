//
//  PhotoCell.swift
//  CollectionViewTask
//
//  Created by Sona Hunanyan on 02.07.25.
//
import UIKit

class PhotoCell: UICollectionViewCell {
    static let identifier = "PhotoCell"
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let heartButton = UIButton(type: .system)
    private var photo: Photo?
    var toggleFavorite: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func render() {
        contentView.backgroundColor = .secondarySystemGroupedBackground
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.numberOfLines = 1
        heartButton.addTarget(self, action: #selector(onTapFavorite), for: .touchUpInside)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(heartButton)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            titleLabel.rightAnchor.constraint(equalTo: heartButton.leftAnchor, constant: -4),
            heartButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            heartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            heartButton.widthAnchor.constraint(equalToConstant: 24),
            heartButton.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    func initialize(with photo: Photo) {
        self.photo = photo
        imageView.image = UIImage(named: photo.imageName)
        titleLabel.text = photo.title
        let imageName = photo.isFavorite ? "heart.fill" : "heart"
        heartButton.setImage(UIImage(systemName: imageName), for: .normal)
        heartButton.tintColor = photo.isFavorite ? .systemPink : .gray
    }
    
    @objc private func onTapFavorite() {
        toggleFavorite?()
    }
}
