//
//  ViewController.swift
//  Quizzler
//
//  Created by sidzhe on 10.04.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var quationData = QuastionData()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 20
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Background-Bubbles")
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 30)
        label.textColor = .systemPink
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Score: 0"
        label.textAlignment = .left
        label.font = UIFont(name: "Verdana", size: 18)
        label.textColor = .systemPink
        return label
    }()
    
    private lazy var buttonOne: UIButton = {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 20)
        button.addTarget(self, action: #selector(pressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonTwo: UIButton = {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 20)
        button.addTarget(self, action: #selector(pressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonThree: UIButton = {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 20)
        button.addTarget(self, action: #selector(pressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var progressBar: UIProgressView = {
        let view = UIProgressView()
        view.progressTintColor = .systemPink
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
    }
    
    // MARK: LOAD VIEWS
    
    private func setupViews() {
        view.backgroundColor = .systemGray3
        view.addSubview(imageView)
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(scoreLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(buttonThree)
        stackView.addArrangedSubview(buttonTwo)
        stackView.addArrangedSubview(buttonOne)
        stackView.addArrangedSubview(progressBar)
        
        updateUI()
        
        imageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
            make.left.right.equalToSuperview().inset(35)
        }
        progressBar.snp.makeConstraints { make in
            make.height.equalTo(5)
        }
        buttonOne.snp.makeConstraints { make in
            make.height.equalTo(80)
        }
        buttonTwo.snp.makeConstraints { make in
            make.height.equalTo(80)
        }
        buttonThree.snp.makeConstraints { make in
            make.height.equalTo(80)
        }
    }
    
    // MARK: Methods
    
    @objc private func pressed(sender: UIButton) {
        let userSelected = quationData.checkAnswer(answer: sender.currentTitle ?? "Error")
        
        if userSelected {
            sender.setBackgroundImage(UIImage(named: "buttongreen"), for: .normal)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1)
            { sender.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal) }
        } else {
            sender.setBackgroundImage(UIImage(named: "buttonred"), for: .normal)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1)
            { sender.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal) }
        }
        quationData.nextQuastion()
        updateUI()
    }
    
    private func updateUI() {
        alert()
        quationData.setButtons(buttonOne, buttonTwo, buttonThree)
        titleLabel.text = quationData.getQuastionText()
        progressBar.progress = quationData.progressIndicator()
        scoreLabel.text = "Score: \(quationData.rightAnswers)"
    }
    
    private func alert() {
        
        
        if quationData.boolValue {
            let alert = UIAlertController(title: "The end.",
                                          message: "Your score: \(quationData.result) \n \(quationData.resultString(quationData.result))",
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
}
