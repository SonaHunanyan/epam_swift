//
//  ContentView.swift
//  FrameworksInteraction2
//
//  Created by Sona Hunanyan on 25.08.25.
//

import SwiftUI
import UIKit


struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, from SwiftUI!")
                .font(.title)
            ViewControllerWrapper()
        }
        .padding()
    }
}

class ViewController: UIViewController {
    private let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    private func setup() {
        label.text = "Hello, from UIKit!"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}


struct ViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {}
}


#Preview {
    ContentView()
}
