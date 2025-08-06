//
//  ImagesCellView.swift
//  ApplicationBundle2
//
//  Created by Sona Hunanyan on 07.08.25.
//

import UIKit

class ImageCellView: UITableViewCell {
    static let identifier = "ImageCellView"
    let randomImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        randomImageView.contentMode = .scaleAspectFill
        randomImageView.clipsToBounds = true
        contentView.addSubview(randomImageView)
        randomImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            randomImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            randomImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            randomImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            randomImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            randomImageView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    
    func configure(with url: URL){
        self.randomImageView.image = nil
        ImagesRepository.instance.loadImageFromUrl(url) { image in
            self.randomImageView.image = image
        }
    }
}
