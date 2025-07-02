//
//  ViewController.swift
//  StackViewTask
//
//  Created by Sona Hunanyan on 02.07.25.
//

import UIKit

class ProfileViewController: UIViewController {

    private let profileImageView = UIImageView()
      private let nameLabel = UILabel()
      private let followButton = UIButton()
      private let bioLabel = UILabel()
      private let mainStack = UIStackView()
      private let statsStack = UIStackView()
      private var isFollowing = false

      override func viewDidLoad() {
          super.viewDidLoad()
          view.backgroundColor = .systemBackground
          render()
      }

      private func render() {
          profileImageView.image = UIImage(named: "Profile")
          profileImageView.layer.cornerRadius = 40
          profileImageView.clipsToBounds = true
          profileImageView.contentMode = .scaleAspectFill
          profileImageView.translatesAutoresizingMaskIntoConstraints = false
          profileImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
          profileImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
          nameLabel.text = "Bojack Horseman"
          nameLabel.font = .boldSystemFont(ofSize: 18)
          followButton.setTitle("Follow", for: .normal)
          followButton.setTitleColor(.white, for: .normal)
          followButton.backgroundColor = .systemBlue
          followButton.layer.cornerRadius = 8
          var config = UIButton.Configuration.filled()
          config.contentInsets = NSDirectionalEdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 12)
          followButton.configuration = config
          followButton.addTarget(self, action: #selector(toggleFollow), for: .touchUpInside)
          bioLabel.text = "Actor and former sitcom star best known for Horsing Around. Navigating fame, failure, and redemption in modern-day Hollywood."
          bioLabel.font = .systemFont(ofSize: 14)
          bioLabel.numberOfLines = 0
          bioLabel.textAlignment = .center
          let userInfoStack = UIStackView(arrangedSubviews: [profileImageView, renderHeaderStack()])
          userInfoStack.axis = .horizontal
          userInfoStack.alignment = .center
          userInfoStack.spacing = 16
          statsStack.axis = .horizontal
          statsStack.spacing = 15
          let statsItems = [renderStatisticTitle(title: "Followers", value: "1200"), renderStatisticTitle(title: "Following", value: "180"), renderStatisticTitle(title: "Posts", value: "75")]
          statsItems.forEach{
              statsStack.addArrangedSubview($0)
          }
          mainStack.axis = .vertical
          mainStack.spacing = 16
          mainStack.alignment = .center
          mainStack.translatesAutoresizingMaskIntoConstraints = false
          mainStack.addArrangedSubview(userInfoStack)
          mainStack.addArrangedSubview(bioLabel)
          mainStack.addArrangedSubview(statsStack)
          view.addSubview(mainStack)
          NSLayoutConstraint.activate([
              mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
              mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
              mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
          ])
      }

      private func renderHeaderStack() -> UIStackView {
          let stack = UIStackView(arrangedSubviews: [nameLabel, followButton])
          stack.axis = .vertical
          stack.alignment = .leading
          stack.spacing = 8
          return stack
      }

      private func renderStatisticTitle(title: String, value: String) -> UILabel {
          let label = UILabel()
          label.text = "\(value)\n\(title)"
          label.font = .systemFont(ofSize: 16, weight: .semibold)
          label.textColor = .black
          label.numberOfLines = 0
          return label
      }

      @objc private func toggleFollow() {
          isFollowing.toggle()
          followButton.setTitle(isFollowing ? "Unfollow" : "Follow", for: .normal)
          followButton.backgroundColor = isFollowing ? .systemGray : .systemBlue
      }
  }
