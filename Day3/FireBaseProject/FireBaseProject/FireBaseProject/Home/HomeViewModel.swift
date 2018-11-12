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
        guard userManager.currentUserUUId != nil else {
            return nil
        }
        return userManager.currentEmail ?? "anonymous"
    }

    func getUsers(completion: @escaping ([UserModel]?) -> Void) {
        guard let currentUserUUId = userManager.currentUserUUId else {
            completion(nil)
            return
        }
        userManager.getUsers { value in
            guard let value = value else {
                completion([])
                return
            }
            let users = value.compactMap({ (userEntry) -> UserModel? in
                let (key, value) = userEntry
                guard let userUuid = key as? String,
                    userUuid != self.userManager.currentUserUUId,
                    let valueDictionary = value as? NSDictionary,
                    let username = valueDictionary["username"] as? String,
                    let online = valueDictionary["online"] as? Bool else {
                    return nil
                }
                return UserModel(username: username, online: online, uuid: userUuid)
            })
            completion(users)
        }
    }

    func removeObservers() {
        Database.database().reference().removeAllObservers()
    }
}
