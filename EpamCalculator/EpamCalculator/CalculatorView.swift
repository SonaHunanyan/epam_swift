import UIKit

class CalculatorView: UIView {
    let resultLabel = UILabel()
    
    init(){
        super.init(frame: .zero)
        setup()
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setup(){
        backgroundColor = .black
    }
    
    private func render() {
        addSubview(resultLabel)
        renderResultLabel()
    }
    
    private func renderResultLabel() {
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.text = "0.0"
        resultLabel.textColor = .white
        resultLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            resultLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}

#Preview {
    CalculatorView()
}
