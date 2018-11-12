//
//  HomeViewModel.swift
//  FireBaseProject
//
//  Created by fauquette fred on 29/10/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import Firebase
import Foundation

struct HomeViewModel {
    
    let userManager: UserProtocol
    
    func logOut(completion: (Bool, Error?) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        let ref = Database.database().reference().child("users").child(currentUser.uid)
        ref.updateChildValues(["online": false])
        do {
            try Auth.auth().signOut()
            completion(true, nil)
        } catch {
            completion(false, error)
        }
    }

    func logIn() {
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        let ref = Database.database().reference().child("users").child(currentUser.uid)
        ref.setValue([
            "username": currentUser.email,
            "online": true,
        ])
    }

    var displayUserInfo: String? {
        return Auth.auth().currentUser?.email
    }

    func getUsers(completion: @escaping ([UserModel]) -> Void) {
        guard let currentUserUUId = userManager.currentUserUUId else {
            completion([])
            return
        }
        userManager.getUsers(completion: completion)
    }
    
    func removeObservers() {
        Database.database().reference().removeAllObservers()
    }
}
