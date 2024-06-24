//
//  ViewController.swift
//  CalculatorApp
//
//  Created by t2023-m0117 on 6/21/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var firstNumber = "0"
    //    private var secondNumber = ""
    //    private var operation = ""

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorUI()
        // Do any additional setup after loading the view.
    }
    
    private func calculatorUI() {
        view.backgroundColor = .black
        
        // 레이블 설정
        label.text = "\(firstNumber)"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 60)
        label.textAlignment = .right
        
        // 버튼 설정
        colorButton(button: plusButton, title: "+")
        setupButton(button: sevenButton, title: "7")
        setupButton(button: eightButton, title: "8")
        setupButton(button: nineButton, title: "9")
        
        // 두번째 버튼 설정
        setupButton(button: fourButton, title: "4")
        setupButton(button: fiveButton, title: "5")
        setupButton(button: sixButton, title: "6")
        colorButton(button: minusButton, title: "-")
        
        //세번째 버튼 설정
        setupButton(button: oneButton, title: "1")
        setupButton(button: twoButton, title: "2")
        setupButton(button: threeButton, title: "3")
        colorButton(button: multplyButton, title: "*")
        
        //네번째 버튼 설정
        colorButton(button: resetButton, title: "AC")
        setupButton(button: zeroButton, title: "0")
        colorButton(button: equalButton, title: "=")
        colorButton(button: dividButton, title: "/")
        
        // 1.스택뷰 설정
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(sevenButton)
        stackView.addArrangedSubview(eightButton)
        stackView.addArrangedSubview(nineButton)
        stackView.addArrangedSubview(plusButton)
        
        // 2.스택뷰 설정
        stackView1.axis = .horizontal
        stackView1.spacing = 10
        stackView1.distribution = .fillEqually
        stackView1.addArrangedSubview(fourButton)
        stackView1.addArrangedSubview(fiveButton)
        stackView1.addArrangedSubview(sixButton)
        stackView1.addArrangedSubview(minusButton)
        
        // 3.스택뷰 설정
        stackView2.axis = .horizontal
        stackView2.spacing = 10
        stackView2.distribution = .fillEqually
        stackView2.addArrangedSubview(oneButton)
        stackView2.addArrangedSubview(twoButton)
        stackView2.addArrangedSubview(threeButton)
        stackView2.addArrangedSubview(multplyButton)
        
        //4. 스택뷰 설정
        stackView3.axis = .horizontal
        stackView3.spacing = 10
        stackView3.distribution = .fillEqually
        stackView3.addArrangedSubview(resetButton)
        stackView3.addArrangedSubview(zeroButton)
        stackView3.addArrangedSubview(equalButton)
        stackView3.addArrangedSubview(dividButton)
        
        //숫자버튼 액션
        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchDown)
        oneButton.addTarget(self, action: #selector(oneButtonTapped), for: .touchDown)
        twoButton.addTarget(self, action: #selector(twoButtonTapped), for: .touchDown)
        threeButton.addTarget(self, action: #selector(threeButtonTapped), for: .touchDown)
        fourButton.addTarget(self, action: #selector(fourButtonTapped), for: .touchDown)
        fiveButton.addTarget(self, action: #selector(fiveButtonTapped), for: .touchDown)
        sixButton.addTarget(self, action: #selector(sixButtonTapped), for: .touchDown)
        sevenButton.addTarget(self, action: #selector(sevenButtonTapped), for: .touchDown)
        eightButton.addTarget(self, action: #selector(eightButtonTapped), for: .touchDown)
        nineButton.addTarget(self, action: #selector(nineButtonTapped), for: .touchDown)
        zeroButton.addTarget(self, action: #selector(zeroButtonTapped), for: .touchDown)
        
        //연산자 액션
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchDown)
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchDown)
        multplyButton.addTarget(self, action: #selector(multplyButtonTapped), for: .touchDown)
        dividButton.addTarget(self, action: #selector(dividButtonTapped), for: .touchDown)
        equalButton.addTarget(self, action: #selector(equalButtonTapped), for: .touchDown)
        
        // 뷰 추가
        view.addSubview(label)
        view.addSubview(stackView)
        view.addSubview(stackView1)
        view.addSubview(stackView2)
        view.addSubview(stackView3)
        
        // 제약 조건 설정
        label.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalToSuperview().offset(200)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(60)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(80)
        }
        
        stackView1.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(80)
        }
        
        stackView2.snp.makeConstraints {
            $0.top.equalTo(stackView1.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(80)
        }
        
        stackView3.snp.makeConstraints {
            $0.top.equalTo(stackView2.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(80)
        }
        
    }
    //숫자 버튼 설정
    private func setupButton(button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 40
    }
    // 연산자 버튼 설정
    private func colorButton(button: UIButton, title: String) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.backgroundColor = UIColor(red: 255/255, green: 147/255, blue: 0/255, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 40
    }
    
    //액션 함수
    //초기화 버튼
    @objc
    private func resetButtonTapped() {
        firstNumber = "0"
        label.text = "\(firstNumber)"
    }
   
    //1버튼 액션
    @objc
    private func oneButtonTapped () {
        if firstNumber == "0" {
            firstNumber = "1"
            label.text = "\(firstNumber)"
        } else {
            firstNumber += "1"
            label.text = "\(firstNumber)"
        }
    }
    
    //2버튼 액션
    @objc
    private func twoButtonTapped() {
        if firstNumber == "0" {
            firstNumber = "2"
            label.text = "\(firstNumber)"
        } else {
            firstNumber += "2"
            label.text = "\(firstNumber)"
        }
    }
    
    //3버튼 액션
    @objc
    private func threeButtonTapped() {
        if firstNumber == "0" {
            firstNumber = "3"
            label.text = "\(firstNumber)"
        } else {
            firstNumber += "3"
            label.text = "\(firstNumber)"
        }
    }
    
    //4버튼 액션
    @objc
    private func fourButtonTapped() {
        if firstNumber == "0" {
            firstNumber = "4"
            label.text = "\(firstNumber)"
        } else {
            firstNumber += "4"
            label.text = "\(firstNumber)"
        }
    }
    
    //5버튼 액션
    @objc
    private func fiveButtonTapped() {
        if firstNumber == "0" {
            firstNumber = "5"
            label.text = "\(firstNumber)"
        } else {
            firstNumber += "5"
            label.text = "\(firstNumber)"
        }
    }
    
    //6버튼 액션
    @objc
    private func sixButtonTapped() {
        if firstNumber == "0" {
            firstNumber = "6"
            label.text = "\(firstNumber)"
        } else {
            firstNumber += "6"
            label.text = "\(firstNumber)"
        }
    }
    
    //7버튼 액션
    @objc
    private func sevenButtonTapped() {
        if firstNumber == "0" {
            firstNumber = "7"
            label.text = "\(firstNumber)"
        } else {
            firstNumber += "7"
            label.text = "\(firstNumber)"
        }
    }
    
    //8버튼 액션
    @objc
    private func eightButtonTapped() {
        if firstNumber == "0" {
            firstNumber = "8"
            label.text = "\(firstNumber)"
        } else {
            firstNumber += "8"
            label.text = "\(firstNumber)"
        }
    }
    
    //9버튼 액션
    @objc
    private func nineButtonTapped() {
        if firstNumber == "0" {
            firstNumber = "9"
            label.text = "\(firstNumber)"
        } else {
            firstNumber += "9"
            label.text = "\(firstNumber)"
        }
    }
    
    //0버튼 액션
    @objc
    private func zeroButtonTapped() {
        if firstNumber == "0" {
            firstNumber = "0"
            label.text = "\(firstNumber)"
        } else {
            firstNumber += "0"
            label.text = "\(firstNumber)"
        }
    }
    
    //플러스 버튼
    @objc
    private func plusButtonTapped() {
        if firstNumber == "0" {
            firstNumber = "+"
            label.text = "error"
        } else {
            firstNumber += "+"
            label.text = "\(firstNumber)"
        }
    }
    
    @objc
    private func minusButtonTapped() {
        if firstNumber == "0" {
            firstNumber = "-"
            label.text = "\(firstNumber)"
        } else {
            firstNumber += "-"
            label.text = "\(firstNumber)"
        }
    }
    
    @objc
    private func multplyButtonTapped() {
        if firstNumber == "0" {
            firstNumber = "*"
            label.text = "error"
        } else {
            firstNumber += "*"
            label.text = "\(firstNumber)"
        }
    }
    
    @objc
    private func dividButtonTapped() {
        if firstNumber == "0" {
            firstNumber = "/"
            label.text = "error"
        } else {
            firstNumber += "/"
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
    
    // 계산 함수
    private func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return 0
        }
    }
}
