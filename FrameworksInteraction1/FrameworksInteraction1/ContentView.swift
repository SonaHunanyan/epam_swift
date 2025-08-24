//
//  ContentView.swift
//  FrameworksInteraction1
//
//  Created by Sona Hunanyan on 25.08.25.
//

import SwiftUI
import UIKit


struct ContentView: View {
    var onDismiss: (() -> Void)?

    var body: some View {
        VStack(spacing: 20) {
            Text("Hola Swift UI")
                .font(.title)
            Button("Dismiss") {
                onDismiss?()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}


class ViewController: UIViewController {
  private let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    private func setup() {
        button.setTitle("Display the SwiftUI View", for: .normal)
        button.addTarget(self, action: #selector(showSwiftUIView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func showSwiftUIView() {
        let hostingController = UIHostingController(rootView: ContentView(
            onDismiss: { [weak self] in
                self?.dismiss(animated: true)
            }
        ))
        present(hostingController, animated: true)
    }
}

struct ViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {}
}


#Preview {
    ViewControllerWrapper()
}


