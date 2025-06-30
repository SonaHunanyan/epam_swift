//
//  ViewController.swift
//  ScrollView
//
//  Created by Sona Hunanyan on 30.06.25.
//

import UIKit

class MainController: UIViewController, UIScrollViewDelegate {
    private let bigImageView = UIImageView(image: UIImage(named: "BigImage"))
    private let scrollView = UIScrollView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    private func setup() {
        view.addSubview(scrollView)
        scrollView.addSubview(bigImageView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        bigImageView.translatesAutoresizingMaskIntoConstraints = false
        bigImageView.contentMode = .scaleAspectFit
        scrollView.minimumZoomScale = 1
        scrollView.maximumZoomScale = 10
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isDirectionalLockEnabled = true
        scrollView.alwaysBounceHorizontal = false
        
        scrollView.delegate = self
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bigImageView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            bigImageView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            bigImageView.centerXAnchor.constraint(equalTo: scrollView.frameLayoutGuide.centerXAnchor),
            bigImageView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
        ])
        centerImage()
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return bigImageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        centerImage()
    }
    
    private func centerImage() {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width - 40
        let screenHeight = screenSize.height - 40
        let imageSize = bigImageView.frame.size
        print(imageSize)
        
        let horizontalInset = (screenWidth -  imageSize.width) / 2
        let verticalInset = (screenHeight - imageSize.height) / 2
        
        scrollView.contentInset = UIEdgeInsets(top: verticalInset,
                                               left: horizontalInset,
                                               bottom: verticalInset,
                                               right: horizontalInset,
        )
    }
}

