//
//  TVShowCell.swift
//  Networking2
//
//  Created by Sona Hunanyan on 19.07.25.
//

import UIKit

class TVShowCell: UITableViewCell {
    static let identifier = "TVShowCell"
    let tvShowImage = UIImageView()
    let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Fail to init coder")
    }
    
    private func setup() {
        tvShowImage.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(tvShowImage)
        contentView.addSubview(label)
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        tvShowImage.contentMode = .scaleAspectFill
        tvShowImage.clipsToBounds = true
        NSLayoutConstraint.activate([
            tvShowImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tvShowImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tvShowImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            tvShowImage.heightAnchor.constraint(equalToConstant: 120),
            
            label.leadingAnchor.constraint(equalTo: tvShowImage.leadingAnchor, constant: 12),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
        ])
    }
    func configure(with tvShow: TVShow) {
        label.text = tvShow.name
        if let imagePath = tvShow.posterPath,
           let url = URL(string: "https://image.tmdb.org/t/p/w500\(imagePath)")
        {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self.tvShowImage.image = UIImage(data: data)
                }
            }.resume()
        } else {
            print("Error getting image path")
        }
    }
}
