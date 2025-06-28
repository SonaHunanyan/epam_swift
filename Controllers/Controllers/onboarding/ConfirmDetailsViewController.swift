import UIKit

class ConfirmDetailsViewController: UIViewController {
    
    var user: User?
    private let nameLabel = UILabel()
    private let phoneLabel = UILabel()
    private let notificationLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        render()
    }
    
    private func render() {
        nameLabel.text = "Name: \(user?.name ?? "")"
        phoneLabel.text = "Phone Number: \(user?.phone ?? "")"
        notificationLabel.text = "Notification Preference: \(user?.notificationPreference ?? "")"
        
        setupLabel(label: nameLabel)
        setupLabel(label: phoneLabel)
        setupLabel(label: notificationLabel)
        
        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let items: [UIView] = [
            nameLabel,
            phoneLabel,
            notificationLabel,
            renderButton(title: "Edit personal info", onTap: #selector(onEditPersonalInfo)),
            renderButton(title: "Edit preferences", onTap: #selector(onEditPreferences)),
            renderButton(title: "Start over", onTap: #selector(startOver)),
            renderButton(title: "Confirm", onTap: #selector(confirm))
        ]
        items.forEach { stackView.addArrangedSubview($0) }

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func renderButton(title: String, onTap: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.addTarget(self, action: onTap, for: .touchUpInside)
        return button
    }
    
    private func setupLabel(label: UILabel) {
        label.font = .systemFont(ofSize: 16, weight: .semibold)
    }

    private func popToViewController<T: UIViewController>(ofType type: T.Type) {
        if let vc = navigationController?.viewControllers.first(where: { $0 is T }) {
            navigationController?.popToViewController(vc, animated: true)
        }
    }
    
    @objc private func startOver() {
        navigationController?.popToRootViewController(animated: true)
    }

    @objc private func onEditPersonalInfo() {
        popToViewController(ofType: PersonalInfoViewController.self)
    }

    @objc private func onEditPreferences() {
        popToViewController(ofType: PreferencesViewController.self)
    }

    @objc private func confirm() {
        let alert = UIAlertController(
            title: "You have successfully completed onboarding",
            message: nil,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            guard
                let self,
                let navController = self.navigationController,
                let onboarding = navController.viewControllers.first as? OnboardingController
            else { return }

            onboarding.button.setTitle("Restart", for: .normal)
            onboarding.button.backgroundColor = .systemGreen
            navController.popToRootViewController(animated: true)
        })
        present(alert, animated: true)
    }
}
