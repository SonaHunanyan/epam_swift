import UIKit

class MainViewController: UIViewController, UITableViewDataSource {
    private let tableView = UITableView()
    private var images: [URL] = []
    
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
        loadData()
    }
    
    private func loadData() {
        images = ImageCacheService.instance.loadCachedImages()
        tableView.reloadData()
        
        ImagesRepository.instance.getImages { urls in
            self.images = urls
            ImageCacheService.instance.cacheImages(images: urls)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 60))
        clearCacheButton.frame = CGRect(x: 16, y: 8, width: view.frame.width - 32, height: 44)
        clearCacheButton.addTarget(self, action: #selector(clearCacheTapped), for: .touchUpInside)
        headerView.addSubview(clearCacheButton)
        tableView.tableHeaderView = headerView
        tableView.dataSource = self
        tableView.register(ImageCellView.self, forCellReuseIdentifier: ImageCellView.identifier)
        tableView.rowHeight = 200
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        clearCacheButton.addTarget(self, action: #selector(clearCacheTapped), for: .touchUpInside)
    }
        
    @objc private func clearCacheTapped() {
        ImageCacheService.instance.clearCache()
        showSnackbar(message: "Cache cleaned!", backgroundColor: .green)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageCellView.identifier, for: indexPath) as? ImageCellView else {
            return UITableViewCell()
        }
        let url = images[indexPath.row]
        cell.configure(with: url)
        return cell
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
