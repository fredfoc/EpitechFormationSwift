//
//  HomeViewModel.swift
//  FireBaseProject
//
//  Created by fauquette fred on 29/10/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import Foundation

class HomeViewModelImpl {
    weak var viewController: HomeViewController?
    let userManager: UserProtocol

    init(userManager: UserProtocol, viewController: HomeViewController?) {
        self.viewController = viewController
        self.userManager = userManager
        self.userManager.registerUser()
    }

    func logOut(completion: (Bool, Error?) -> Void) {
        userManager.logOut(completion: completion)
    }

    func getUsers(completion: @escaping ([User]) -> Void) {
        userManager.registerForChange { [weak self] result in
            switch result {
            case let .success(users):
                completion(users)
            case let .failure(error):
                self?.viewController?.displayAlert(with: error.localizedDescription)
                completion([])
            }
        }
    }

    var displayUserInfo: String? {
        return userManager.displayUserInfo
    }
}

extension HomeViewModelImpl: HomeViewModel {
}
