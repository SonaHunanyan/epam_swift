//
//  ViewController.swift
//  ScrollView
//
//  Created by Sona Hunanyan on 30.06.25.
//
import UIKit

class MainController: UIViewController, UIScrollViewDelegate {
    private let scrollView = UIScrollView()
    private let bigImageView = UIImageView(image: UIImage(named: "BigImage"))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        render()
        renderImageView()
    }

    private func render() {
        view.addSubview(scrollView)
        scrollView.delegate = self
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 4.0
        scrollView.bounces = true
        scrollView.alwaysBounceVertical = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isScrollEnabled = true
        scrollView.isDirectionalLockEnabled = true
    }
    private func renderImageView() {
        scrollView.addSubview(bigImageView)
        bigImageView.contentMode = .scaleAspectFit
        bigImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bigImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            bigImageView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            bigImageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            bigImageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return bigImageView
    }
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerImage()
    }
    private func centerImage() {
        let scrollViewSize = scrollView.bounds.size
        let imageSize = bigImageView.frame.size
        let verticalInset = max((scrollViewSize.height - imageSize.height) / 2, 0)
        let horizontalInset = max((scrollViewSize.width - imageSize.width) / 2, 0)
        scrollView.contentInset = UIEdgeInsets(
            top: verticalInset,
            left: horizontalInset,
            bottom: verticalInset,
            right: horizontalInset
        )
    }
}
