//
//  ViewController.swift
//  CollectionViewTask
//
//  Created by Sona Hunanyan on 02.07.25.
//

import UIKit

class GalleryViewController: UIViewController {
    private var groupedPhotos: [String: [Photo]] = [:]
    private var sortedSectionTitles: [String] = []
    private let photos = PhotoRepository.getPhotos()
    private var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        render()
        groupPhotos()
    }
    
    private func groupPhotos() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        groupedPhotos = Dictionary(grouping: photos) {
            formatter.string(from: $0.date)
        }
        sortedSectionTitles = groupedPhotos.keys.sorted()
    }
    
    private func render() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0/3),
                                                   heightDimension: .fractionalWidth(1.0 / 3 + 0.1))
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                repeatingSubitem: item,
                count: 3
            )
            let section = NSCollectionLayoutSection(group: group)
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                    heightDimension: .absolute(40))
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top)
            
            section.boundarySupplementaryItems = [header]
            return section
        }
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
        collectionView.register(SectionHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: SectionHeaderView.identifier)
    }
}


extension GalleryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sortedSectionTitles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let key = sortedSectionTitles[section]
        return groupedPhotos[key]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let key = sortedSectionTitles[indexPath.section]
        var photo = groupedPhotos[key]![indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as! PhotoCell
        cell.initialize(with: photo)
        cell.toggleFavorite = { [weak self] in
            guard let self = self else { return }
            photo.isFavorite.toggle()
            self.groupedPhotos[key]![indexPath.item] = photo
            collectionView.reloadItems(at: [indexPath])
            let message = photo.isFavorite
            ? "Marked \(photo.title) as Favorite!"
            : "Removed \(photo.title) from Favorites."
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let view = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionHeaderView.identifier,
                for: indexPath) as! SectionHeaderView
            view.titleLabel.text = sortedSectionTitles[indexPath.section]
            return view
        }
        return UICollectionReusableView()
    }
}
