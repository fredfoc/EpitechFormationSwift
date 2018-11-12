//
//  HomeViewInjector.swift
//  FireBaseProject
//
//  Created by fauquette fred on 12/11/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import UIKit

protocol HomeViewModelProtocol {
    func logOut(completion: (Bool, Error?) -> Void)
    func logIn()
    var displayUserInfo: String? {get}
    func getUsers(completion: @escaping ([UserModel]?) -> Void)
    func removeObservers()
}

protocol HomeViewInjector {
    func resolve() -> UIViewController?
    func resolve(vc: HomeViewController) -> HomeViewModelProtocol
    func resolve() -> UserProtocol
}

extension HomeViewInjector {
    func resolve() -> UIViewController? {
        guard let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeVC") as? HomeViewController else {
            return nil
        }
        homeVC.homeViewModel = resolve(vc: homeVC)
        return homeVC
    }
    func resolve(vc: HomeViewController) -> HomeViewModelProtocol {
        return HomeViewModel(userManager: resolve())
    }
    func resolve() -> UserProtocol {
        return FireBaseManager()
    }
}

struct HomeViewInjectorImpl: HomeViewInjector { }
