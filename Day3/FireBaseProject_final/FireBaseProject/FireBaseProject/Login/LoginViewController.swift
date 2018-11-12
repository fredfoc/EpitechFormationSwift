//
//  ViewController.swift
//  FireBaseProject
//
//  Created by fauquette fred on 29/10/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet private var emailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!

    let presenter = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if presenter.userIsLogguedIn() {
            displayHomeViewController()
        }
    }

    @IBAction private func createProfile() {
        presenter.createProfile(email: emailTextField.text,
                                password: passwordTextField.text) { [weak self] result in
            self?.analyseResult(result: result)
        }
    }

    private func displayHomeViewController() {
        guard let homeVC = HomeInjectorImpl().resolveHomeViewController() else {
            return
        }
        navigationController?.show(homeVC, sender: nil)
    }

    private func analyseResult(result: LoginResult) {
        switch result {
        case .success:
            displayHomeViewController()
        case let .failure(error):
            displayAlert(with: error.localizedDescription)
        }
    }

    @IBAction private func submitProfile() {
        presenter.submitProfile(email: emailTextField.text, password: passwordTextField.text) { [weak self] result in
            self?.analyseResult(result: result)
        }
    }
}
