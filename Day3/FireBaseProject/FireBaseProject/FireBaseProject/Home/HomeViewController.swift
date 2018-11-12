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
    @IBOutlet private weak var tableView: UITableView!
    
    var users = [UserModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(logOut))
        userInfos.text = HomeViewModel().displayUserInfo
        
        HomeViewModel().getUsers {[weak self] (users) in
            self?.users = users
            self?.tableView.reloadData()
        }
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

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.username
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
