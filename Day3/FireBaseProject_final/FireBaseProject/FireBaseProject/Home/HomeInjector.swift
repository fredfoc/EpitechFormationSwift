//
//  HomeInjector.swift
//  FireBaseProject
//
//  Created by fauquette fred on 11/11/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import UIKit

protocol HomeViewController: class {
    func displayAlert(with message: String?)
}

protocol HomeViewModel {
    var displayUserInfo: String? { get }
    func getUsers(completion: @escaping ([User]) -> Void)
    func logOut(completion: (Bool, Error?) -> Void)
}

protocol UserProtocol {
    func registerUser()
    func getUsers(completion: @escaping (FireBaseUsersResult) -> Void)
    func registerForChange(completion: @escaping (FireBaseUsersResult) -> Void)
    func removeObserver()
    func logOut(completion: (Bool, Error?) -> Void)
    var displayUserInfo: String? { get }
}

protocol HomeInjector {
    func resolveHomeViewController() -> UIViewController?
    func resolveHomeViewModel(vc: HomeViewController) -> HomeViewModel
    func resolveUserManager() -> UserProtocol
}

extension HomeInjector {
    func resolveHomeViewController() -> UIViewController? {
        guard let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeVC") as? HomeViewControllerImpl else {
            return nil
        }
        homeVC.homeViewModel = resolveHomeViewModel(vc: homeVC)
        return homeVC
    }

    func resolveHomeViewModel(vc: HomeViewController) -> HomeViewModel {
        return HomeViewModelImpl(userManager: resolveUserManager(),
                                 viewController: vc)
    }

    func resolveUserManager() -> UserProtocol {
        return FireBaseManager()
    }
}

struct HomeInjectorImpl: HomeInjector {
}
