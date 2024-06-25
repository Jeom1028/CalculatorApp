import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var firstNumber = "0"
    
    let label = UILabel()
    
    // 첫번째 줄
    let plusButton = UIButton()
    let sevenButton = UIButton()
    let eightButton = UIButton()
    let nineButton = UIButton()
    let stackView = UIStackView()
    
    // 두번째 줄
    let fourButton = UIButton()
    let fiveButton = UIButton()
    let sixButton = UIButton()
    let minusButton = UIButton()
    let stackView1 = UIStackView()
    
    // 세번째 줄
    let oneButton = UIButton()
    let twoButton = UIButton()
    let threeButton = UIButton()
    let multplyButton = UIButton()
    let stackView2 = UIStackView()
    
    // 네번째 줄
    let resetButton = UIButton()
    let zeroButton = UIButton()
    let equalButton = UIButton()
    let dividButton = UIButton()
    let stackView3 = UIStackView()
    
    // 수직 스택 뷰
    let verticalStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorUI()
    }
    
    private func calculatorUI() {
        view.backgroundColor = .black
        
        // 레이블 설정
        setupLabel(label)
        
        // 버튼 설정
        setupButtons()
        
        // 스택뷰 설정
        setupStackView(stackView, with: [sevenButton, eightButton, nineButton, plusButton])
        setupStackView(stackView1, with: [fourButton, fiveButton, sixButton, minusButton])
        setupStackView(stackView2, with: [oneButton, twoButton, threeButton, multplyButton])
        setupStackView(stackView3, with: [resetButton, zeroButton, equalButton, dividButton])
        
        // 수직 스택뷰 설정
        setupVerticalStackView()
        
        // 뷰 추가
        view.addSubview(label)
        view.addSubview(verticalStackView)
        
        // 제약 조건 설정
        setupConstraints()
    }
    
    private func setupLabel(_ label: UILabel) {
        label.text = "\(firstNumber)"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 60)
        label.textAlignment = .right
    }
    
    private func setupButtons() {
        colorButton(button: plusButton, title: "+")
        setupButton(button: sevenButton, title: "7")
        setupButton(button: eightButton, title: "8")
        setupButton(button: nineButton, title: "9")
        
        setupButton(button: fourButton, title: "4")
        setupButton(button: fiveButton, title: "5")
        setupButton(button: sixButton, title: "6")
        colorButton(button: minusButton, title: "-")
        
        setupButton(button: oneButton, title: "1")
        setupButton(button: twoButton, title: "2")
        setupButton(button: threeButton, title: "3")
        colorButton(button: multplyButton, title: "*")
        
        colorButton(button: resetButton, title: "AC")
        setupButton(button: zeroButton, title: "0")
        colorButton(button: equalButton, title: "=")
        colorButton(button: dividButton, title: "/")
        
        // 숫자 버튼 액션
        let numberButtons = [oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton, zeroButton]
        for button in numberButtons {
            button.addTarget(self, action: #selector(numberButtonTapped(_:)), for: .touchDown)
        }
        
        //연산자 버튼
        let operatorButtons = [plusButton, minusButton, multplyButton, dividButton]
        for button in operatorButtons {
            button.addTarget(self, action: #selector(operatorButtonTapped(_:)), for: .touchDown)
        }
        //AC 버튼
        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchDown)
        // = 버튼
        equalButton.addTarget(self, action: #selector(equalButtonTapped), for: .touchDown)
    }
    
    private func setupStackView(_ stackView: UIStackView, with buttons: [UIButton]) {
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        for button in buttons {
            stackView.addArrangedSubview(button)
        }
    }
    
    private func setupVerticalStackView() {
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 10
        verticalStackView.distribution = .fillEqually
        verticalStackView.addArrangedSubview(stackView)
        verticalStackView.addArrangedSubview(stackView1)
        verticalStackView.addArrangedSubview(stackView2)
        verticalStackView.addArrangedSubview(stackView3)
    }
    
    private func setupConstraints() {
        label.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalToSuperview().offset(200)
        }
        
        verticalStackView.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(60)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
        }
        
        // 버튼 크기와 모양 설정
        let buttons = [plusButton, sevenButton, eightButton, nineButton, fourButton, fiveButton, sixButton, minusButton, oneButton, twoButton, threeButton, multplyButton, resetButton, zeroButton, equalButton, dividButton]
        for button in buttons {
            button.snp.makeConstraints {
                $0.height.equalTo(80)
                $0.width.equalTo(80)
            }
            button.layer.cornerRadius = 40
        }
    }
    
    // 숫자 버튼 설정
    private func setupButton(button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
    }
    
    // 연산자 버튼 설정
    private func colorButton(button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.backgroundColor = UIColor(red: 255/255, green: 147/255, blue: 0/255, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
    }
    
    // 액션 함수
    @objc
    private func resetButtonTapped() {
        firstNumber = "0"
        label.text = "\(firstNumber)"
    }
    
    @objc
    private func numberButtonTapped(_ sender: UIButton) {
        guard let numberString = sender.titleLabel?.text else { return }
        if firstNumber == "0" {
            firstNumber = numberString
        } else {
            firstNumber += numberString
        }
        label.text = "\(firstNumber)"
    }
    
    @objc
    private func operatorButtonTapped(_ sender: UIButton) {
        guard let operatorString = sender.titleLabel?.text else { return }
        if firstNumber == "0" {
            label.text = "error"
        } else {
            firstNumber += operatorString
            label.text = "\(firstNumber)"
        }
    }

    
    @objc
    private func equalButtonTapped() {
        if firstNumber == "0" {
            label.text = "error"
        } else {
            if let result = calculate(expression: firstNumber) {
                label.text = "\(result)"
            } else {
                label.text = "error"
            }
        }
    }
    
    func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
}
