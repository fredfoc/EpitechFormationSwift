//
//  ViewController.swift
//  FireBaseProject
//
//  Created by fauquette fred on 29/10/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    let presenter = LoginViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
    }
    
    @IBAction private func createProfile() {
        presenter.createProfile(email: emailTextField.text, password: passwordTextField.text)
    }

    
    @IBAction private func submitProfile() {
        presenter.submitProfile(email: emailTextField.text, password: passwordTextField.text)
    }

}

