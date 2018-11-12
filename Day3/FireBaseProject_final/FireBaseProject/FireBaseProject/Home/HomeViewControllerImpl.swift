//
//  HomeViewController.swift
//  FireBaseProject
//
//  Created by fauquette fred on 29/10/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import UIKit

class HomeViewControllerImpl: UIViewController {
    @IBOutlet private var userInfos: UITextView!
    @IBOutlet private var tableView: UITableView!

    var homeViewModel: HomeViewModel?
    var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(logOut))
        userInfos.text = homeViewModel?.displayUserInfo
        homeViewModel?.getUsers { [weak self] users in
            self?.users = users
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    @objc private func logOut() {
        homeViewModel?.logOut { completed, error in
            if completed {
                navigationController?.popToRootViewController(animated: true)
            } else {
                displayAlert(with: error?.localizedDescription)
            }
        }
    }
}

extension HomeViewControllerImpl: HomeViewController {
}

extension HomeViewControllerImpl: UITableViewDelegate {
}

extension HomeViewControllerImpl: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell",
                                                 for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.displayedName
        return cell
    }
}
