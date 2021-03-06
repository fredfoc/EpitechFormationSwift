//
//  HomeViewController.swift
//  FireBaseProject
//
//  Created by fauquette fred on 29/10/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var userInfos: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(logOut))
        userInfos.text = HomeViewModel().displayUserInfo
    }
    
    @objc private func logOut() {
        HomeViewModel().logOut { (completed, error) in
            if completed {
                navigationController?.popToRootViewController(animated: true)
            } else {
                displayAlert(with: error?.localizedDescription)
            }
        }
    }
}
