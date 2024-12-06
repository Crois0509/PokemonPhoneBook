//
//  PhoneBookViewController.swift
//  PokemonPhoneBook
//
//  Created by 장상경 on 12/6/24.
//

import UIKit
import SnapKit

final class PhoneBookViewController: UIViewController {
    
    private let profileImageView = UIImageView()
    private let profileImageRandomChangeButton = UIButton()
    private let nameTextField = UITextField()
    private let numberTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
}

private extension PhoneBookViewController {
    func configUI() {
        view.backgroundColor = .white
        
        [self.profileImageView,
         self.profileImageRandomChangeButton,
         self.nameTextField,
         self.numberTextView].forEach { view.addSubview($0) }

        setupImageView()
        setupChangeButton()
        setupTextField()
        setupTextView()
        setupNavigationTitle()
        setupNavigationRightButton()
        setupUILayout()
    }
    
    func setupImageView() {
        self.profileImageView.contentMode = .scaleAspectFit
        self.profileImageView.backgroundColor = .clear
        self.profileImageView.layer.cornerRadius = 100
        self.profileImageView.clipsToBounds = true
        self.profileImageView.layer.borderColor = UIColor.gray.cgColor
        self.profileImageView.layer.borderWidth = 2
    }
    
    func setupTextField() {
        self.nameTextField.text = ""
        self.nameTextField.font = UIFont.systemFont(ofSize: 15, weight: .light)
        self.nameTextField.borderStyle = .roundedRect
        self.nameTextField.placeholder = "이름을 입력해 주세요"
        self.nameTextField.textColor = .black
        self.nameTextField.keyboardType = .default
    }
    
    func setupTextView() {
        self.numberTextView.text = ""
        self.numberTextView.textColor = .black
        self.numberTextView.font = UIFont.systemFont(ofSize: 15, weight: .light)
        self.numberTextView.textAlignment = .left
        self.numberTextView.layer.borderColor = UIColor.gray.cgColor
        self.numberTextView.layer.borderWidth = 1
        self.numberTextView.layer.cornerRadius = 10
        self.numberTextView.clipsToBounds = true
    }
    
    func setupChangeButton() {
        var config = UIButton.Configuration.plain()
        
        var titleAttr = AttributedString.init("랜덤 이미지 생성")
        titleAttr.font = .systemFont(ofSize: 20, weight: .medium)
        
        config.attributedTitle = titleAttr
        config.baseForegroundColor = .gray
        
        self.profileImageRandomChangeButton.configuration = config
        self.profileImageRandomChangeButton.backgroundColor = .clear
        self.profileImageRandomChangeButton.addTarget(self, action: #selector(changeProfileImage), for: .touchDown)
    }
    
    @objc func changeProfileImage() {
        
    }
    
    func setupUILayout() {
        self.profileImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(200)
        }
        
        self.profileImageRandomChangeButton.snp.makeConstraints {
            $0.top.equalTo(self.profileImageView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(50)
        }
        
        self.nameTextField.snp.makeConstraints {
            $0.top.equalTo(self.profileImageRandomChangeButton.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
        
        self.numberTextView.snp.makeConstraints {
            $0.top.equalTo(self.nameTextField.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
    }
    
    func setupNavigationTitle() {
        let title = UILabel()
        title.text = "연락처 추가"
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        title.textAlignment = .center
        title.backgroundColor = .clear
        
        self.navigationItem.titleView = title
    }
    
    func setupNavigationRightButton() {
        let rightButton = UIBarButtonItem(title: "적용", style: .plain, target: self, action: #selector(savePhoneNumber))
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func savePhoneNumber() {
        
    }
}