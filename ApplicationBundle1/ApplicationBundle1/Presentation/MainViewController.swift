import UIKit

class MainViewController: UIViewController {

    let textFormField = UITextField()
    let saveButton = UIButton(type: .system)
    let appendButton = UIButton(type: .system)
    let loadButton = UIButton(type: .system)
    let filename = "storage.txt"
    let stackView = UIStackView()
    let storedData = UILabel()
    let resultStackView = UIStackView()


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
        appendButton.setTitle("Append", for: .normal)
        appendButton.setTitleColor(.systemBlue, for: .normal)
        appendButton.addTarget(self, action: #selector(append), for: .touchUpInside)
        let buttonStack = UIStackView(arrangedSubviews: [saveButton,appendButton, loadButton])
        buttonStack.axis = .horizontal
        buttonStack.spacing = 12
        buttonStack.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(textFormField)
        stackView.addArrangedSubview(buttonStack)
        setupResultBlock()
        NSLayoutConstraint.activate([
            resultStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: resultStackView.bottomAnchor, constant: 16)
        ])
    }
    
    private func setupResultBlock() {
        let title = UILabel()
        view.addSubview(resultStackView)
        resultStackView.translatesAutoresizingMaskIntoConstraints = false
        resultStackView.axis = .vertical
        resultStackView.spacing = 16
        resultStackView.addArrangedSubview(title)
        resultStackView.addArrangedSubview(storedData)
        storedData.font = .systemFont(ofSize: 14, weight: .medium)
        storedData.textColor = .black
        storedData.text = ""
        title.font = .systemFont(ofSize: 17, weight: .medium)
        title.textColor = .black
        title.text = "Your stored data"
    }

    
    private func updateLabel(_ text: String) {
        storedData.text = text
    }

    @objc private func saveText() {
        guard let text = textFormField.text, !text.isEmpty else {
            showSnackbar(message: "Field is empty", backgroundColor: .systemOrange)
            return
        }

        do {
            try FileService.save(content: text, fileName: filename)
            updateLabel(text)
            showSnackbar(message: "Data saved", backgroundColor: .systemGreen)
        } catch {
            showSnackbar(message: "Fail to save data", backgroundColor: .systemRed)
        }
    }
    
    
    @objc private func append() {
        guard let text = textFormField.text, !text.isEmpty else {
            showSnackbar(message: "Field is empty", backgroundColor: .systemOrange)
            return
        }
        do {
            try FileService.append(content: text, fileName: filename)
            updateLabel(text)
            showSnackbar(message: "Data saved", backgroundColor: .systemGreen)
        } catch {
            showSnackbar(message: "Fail to save data", backgroundColor: .systemRed)
        }
    }

    @objc private func read() {
        do {
            let loadedText = try FileService.read(fileName: filename)
            textFormField.text = loadedText
            updateLabel(loadedText)
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
