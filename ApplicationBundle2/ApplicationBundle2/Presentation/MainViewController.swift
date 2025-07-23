import UIKit

class MainViewController: UIViewController {
    private let stackView = UIStackView()
    private let scrollView = UIScrollView()
    
    private let clearCacheButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clear Cache", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 8
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        let cachedImages = ImageCacheService.instance.loadCachedImages()
        display(images: cachedImages)
        
        ImagesRepository.instance.getImages { urls in
            var images: [UIImage] = []
            let group = DispatchGroup()
            for url in urls {
                group.enter()
                URLSession.shared.dataTask(with: url) { data, _, _ in
                    defer { group.leave() }
                    if let data = data {
                        let image = UIImage(data: data)
                        if let image = image {
                            images.append(image)
                            
                        }
                    }
                }.resume()
            }
            group.notify(queue: .main) {
                self.display(images: images)
                ImageCacheService.instance.cacheImages(images: urls)
            }
                
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            
        ])
        stackView.addArrangedSubview(clearCacheButton)
        clearCacheButton.addTarget(self, action: #selector(clearCacheTapped), for: .touchUpInside)
    }
    
    private func display(images: [UIImage]) {
        DispatchQueue.main.async {
            self.stackView.arrangedSubviews.dropFirst().forEach { $0.removeFromSuperview() }
            
            for image in images {
                let imageView = UIImageView(image: image)
                imageView.contentMode = .scaleAspectFit
                imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
                self.stackView.addArrangedSubview(imageView)
            }
        }
    }
    
    @objc private func clearCacheTapped() {
        ImageCacheService.instance.clearCache()
        showSnackbar(message: "Cache cleaned!", backgroundColor: .green)
    }
}


extension UIViewController {
    func showSnackbar(message: String, backgroundColor: UIColor = .black, textColor: UIColor = .white, duration: TimeInterval = 2.0) {
        let snackbar = UILabel()
        snackbar.text = message
        snackbar.textColor = textColor
        snackbar.backgroundColor = backgroundColor
        snackbar.textAlignment = .center
        snackbar.font = .systemFont(ofSize: 14, weight: .medium)
        snackbar.alpha = 0
        snackbar.numberOfLines = 0
        snackbar.layer.cornerRadius = 8
        snackbar.clipsToBounds = true
        snackbar.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(snackbar)
        
        NSLayoutConstraint.activate([
            snackbar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            snackbar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            snackbar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        
        UIView.animate(withDuration: 0.3) {
            snackbar.alpha = 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            UIView.animate(withDuration: 0.3, animations: {
                snackbar.alpha = 0
            }) { _ in
                snackbar.removeFromSuperview()
            }
        }
    }
}
