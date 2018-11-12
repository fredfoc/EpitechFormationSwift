//
//  HomeViewController.swift
//  FireBaseProject
//
//  Created by fauquette fred on 29/10/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet private var userInfos: UITextView!
    @IBOutlet private var tableView: UITableView!

    var users = [UserModel]()
    let homeViewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(logOut))
        userInfos.text = homeViewModel.displayUserInfo
        homeViewModel.logIn()
        homeViewModel.getUsers { [weak self] users in
            self?.users = users
            self?.tableView.reloadData()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        homeViewModel.removeObservers()
    }

    @objc private func logOut() {
        homeViewModel.logOut { completed, error in
            if completed {
                navigationController?.popToRootViewController(animated: true)
            } else {
                displayAlert(with: error?.localizedDescription)
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.displayName
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chatVC")
        navigationController?.show(chatVC, sender: nil)
    }
}
