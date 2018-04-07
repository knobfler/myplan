//
//  LoginViewController.swift
//  MyPlan
//
//  Created by 최동호 on 2018. 4. 7..
//  Copyright © 2018년 최동호. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    let signupTitle: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Login"
        title.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        return title
    }()
    
    let usernameTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let passwordTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    let leadSignupDesc: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "아직 가입하지 않으셨나요?"
        return label
    }()
    
    let leadSignupButton: UIButton = {
        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("가입하러 가기", for: UIControlState.normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let device = UIDevice.current
        device.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
    }



}

extension LoginViewController {
    
    func setupViews() {
        view.addSubview(signupTitle)
        view.addSubview(usernameTF)
        view.addSubview(passwordTF)
//        view.addSubview(leadSignupDesc)
//        view.addSubview(leadSignupButton)
        
        signupTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        signupTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        
        usernameTF.topAnchor.constraint(equalTo: signupTitle.bottomAnchor, constant: 16).isActive = true
        usernameTF.centerXAnchor.constraint(equalTo: signupTitle.centerXAnchor, constant: 0).isActive = true
        usernameTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32).isActive = true
        usernameTF.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32).isActive = true
        
        passwordTF.topAnchor.constraint(equalTo: usernameTF.bottomAnchor, constant: 8).isActive = true
        passwordTF.centerXAnchor.constraint(equalTo: signupTitle.centerXAnchor, constant: 0).isActive = true
        passwordTF.leftAnchor.constraint(equalTo: usernameTF.leftAnchor, constant: 0).isActive = true
        passwordTF.rightAnchor.constraint(equalTo: usernameTF.rightAnchor, constant: 0).isActive = true

        
//        leadSignupDesc.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 16).isActive = true
//        leadSignupDesc.centerXAnchor.constraint(equalTo: signupTitle.centerXAnchor, constant: 0).isActive = true
//
//        leadSignupButton.topAnchor.constraint(equalTo: leadSignupDesc.bottomAnchor, constant: 8).isActive = true
//        leadSignupButton.centerXAnchor.constraint(equalTo: signupTitle.centerXAnchor, constant: 0).isActive = true
//
        
    }
    
    func signupRequest() {
        
    }
}
