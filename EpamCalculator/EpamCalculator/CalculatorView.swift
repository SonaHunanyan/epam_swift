import UIKit


class Calculator {
    static func split(_ expr: String) -> ([String], [String]) {
        var numbers: [String] = []
        var operators: [String] = []
        var currentNumber = ""
        
        for char in expr {
            if char.isNumber || char == "." {
                currentNumber.append(char)
            } else if "+-x%".contains(char) {
                if !currentNumber.isEmpty {
                    numbers.append(currentNumber)
                    currentNumber = ""
                }
                operators.append(String(char))
            }
        }
        if !currentNumber.isEmpty {
            numbers.append(currentNumber)
        }
        
        return (numbers, operators)
    }
    
    
    static func calculate(expression: String?) -> Double?{
        let splitExpression = split(expression ?? "")
        if splitExpression.0.isEmpty || splitExpression.1.isEmpty {
            return nil
        }
        var result = 0.0
        let numberStrings = splitExpression.0
        let operators = splitExpression.1
        var numbers = numberStrings.compactMap { Double($0) }
        
        guard numbers.count == numberStrings.count else {
            return nil
        }
        
        result = numbers.removeFirst()
        
        for (index, op) in operators.enumerated() {
            guard index < numbers.count else { break }
            let next = numbers[index]
            
            switch op {
            case "+": result += next
            case "-": result -= next
            case "x": result *= next
            case "%": result /= next
            default: return nil
            }
        }
        
        return result
        
    }
}

class CalculatorView: UIView {
    let resultLabel = UILabel()
    let placeholderText = "0.0"
    
    
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
        let mainStack = UIStackView()
        mainStack.axis = .vertical
        mainStack.spacing = 40
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.alignment = .fill
        mainStack.distribution = .equalSpacing

        addSubview(mainStack)
        NSLayoutConstraint.activate([
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            mainStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40)
        ])

        renderResultLabel()
        mainStack.addArrangedSubview(resultLabel)
        mainStack.addArrangedSubview(renderKeyboard())
    }

    
    
    
    private func renderNumberbutton(title: String) -> UIButton{
        return renderButton(title: title,
                            backgroundColor: .gray.withAlphaComponent(0.9),
                            onTap: {
            if self.resultLabel.text == self.placeholderText {
                self.resultLabel.text = title
                return
            }
            self.resultLabel.text = (self.resultLabel.text ?? "") + title
        })
    }
    
    private func renderEqualbutton() -> UIButton{
        return renderButton(title: "=",
                            backgroundColor: .orange,
                            onTap: {
            let result = Calculator.calculate(expression: self.resultLabel.text)
            if let result = result {
                self.resultLabel.text = String(result)
            }
            
        })
    }
    
    private func renderKeyboard() -> UIView{
        let keyboard = UIStackView()
        let buttons = [renderNumberbutton(title: "7"),
                       renderNumberbutton(title: "8"),
                       renderNumberbutton(title: "9"),
                       renderOperatorButton(title: "%"),
                       renderNumberbutton(title: "4"),
                       renderNumberbutton(title: "5"),
                       renderNumberbutton(title: "6"),
                       renderOperatorButton(title: "x"),
                       renderNumberbutton(title: "1"),
                       renderNumberbutton(title: "2"),
                       renderNumberbutton(title: "3"),
                       renderOperatorButton(title: "-"),
                       renderNumberbutton(title: "0"),
                       renderNumberbutton(title: "."),
                       renderEqualbutton(),
                       renderOperatorButton(title: "+"),
        ]
        keyboard.axis = .vertical
        keyboard.spacing = 10
        keyboard.translatesAutoresizingMaskIntoConstraints = false
        keyboard.backgroundColor = .black
        let cleanRow = UIStackView()
        cleanRow.distribution = .fill
        cleanRow.alignment = .leading
        let spacer = UIView()
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        cleanRow.addArrangedSubview(spacer)
        cleanRow.axis = .horizontal
        cleanRow.addArrangedSubview(renderCleanButton())
        keyboard.addArrangedSubview(cleanRow)
        
        for i in 0..<4 {
            let row = UIStackView()
            row.distribution = .fillEqually
            row.alignment = .fill
            row.axis = .horizontal
            row.spacing = 10
            for j in 0..<4{
                row.addArrangedSubview(buttons[i * 4 + j])
            }
            keyboard.addArrangedSubview(row)
        }
        return keyboard
    }
    
    private func renderOperatorButton(title: String) -> UIButton {
        return  renderButton(title: title,
                             backgroundColor: .orange,
                             onTap: {
            self.resultLabel.text = (self.resultLabel.text ?? "") + title
        })
    }
    
    private func renderCleanButton() -> UIButton {
        let cleanButton = renderButton(title: "AC",
                                       backgroundColor: .gray.withAlphaComponent(0.4),
                                       onTap: {
            self.resultLabel.text = self.placeholderText
        })
        
        NSLayoutConstraint.activate([
            cleanButton.widthAnchor.constraint(equalToConstant: 70)
        ])
        return cleanButton
    }
    
    private func renderButton(title:String, backgroundColor: UIColor, onTap: (()-> Void)? = nil ) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 70)
        ])
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = 35
        button.setTitleColor(.white, for: .normal)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize:35, weight: .bold)
        if let onTap = onTap {
            button.addAction(UIAction {
                _ in onTap()
            }, for: .touchUpInside)
        }
        return button
    }
    
    private func renderResultLabel() {
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.text = placeholderText
        resultLabel.textColor = .white
        resultLabel.textAlignment = .right
        resultLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
    }
}

#Preview {
    CalculatorView()
}
