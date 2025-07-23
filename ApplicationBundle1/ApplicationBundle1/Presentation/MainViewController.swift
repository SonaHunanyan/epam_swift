import UIKit

class MainViewController: UIViewController {

    let textFormField = UITextField()
    let saveButton = UIButton()
    let loadButton = UIButton()
    let filename = "storage.txt"
    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }


    private func setup() {
        view.backgroundColor = .white
        textFormField.placeholder = "Enter text..."
        textFormField.font = .systemFont(ofSize: 14)
        textFormField.borderStyle = .roundedRect
        textFormField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.addTarget(self, action: #selector(saveText), for: .touchUpInside)
        loadButton.setTitle("Load", for: .normal)
        loadButton.setTitleColor(.systemBlue, for: .normal)
        loadButton.addTarget(self, action: #selector(read), for: .touchUpInside)
        let buttonStack = UIStackView(arrangedSubviews: [saveButton, loadButton])
        buttonStack.axis = .horizontal
        buttonStack.spacing = 12
        buttonStack.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(textFormField)
        stackView.addArrangedSubview(buttonStack)
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func saveText() {
        guard let text = textFormField.text, !text.isEmpty else {
            showSnackbar(message: "Field is empty", backgroundColor: .systemOrange)
            return
        }

        do {
            try FileService.save(content: text, fileName: filename)
            showSnackbar(message: "Data saved", backgroundColor: .systemGreen)
        } catch {
            showSnackbar(message: "Fail to save data", backgroundColor: .systemRed)
        }
    }

    @objc private func read() {
        do {
            let loadedText = try FileService.read(fileName: filename)
            textFormField.text = loadedText
            showSnackbar(message: "Data loaded", backgroundColor: .systemBlue)
        } catch {
            showSnackbar(message: "Fail to load data", backgroundColor: .systemRed)
        }
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
            snackbar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
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
