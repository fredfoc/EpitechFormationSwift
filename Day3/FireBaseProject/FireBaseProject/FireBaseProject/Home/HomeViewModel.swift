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
        return Auth.auth().currentUser?.uid
    }

    func getUsers(completion: @escaping ([UserModel]) -> Void) {
        let ref = Database.database().reference().child("users")
        ref.observe(.value, with: { snapshot in
            guard let value = snapshot.value as? NSDictionary else {
                completion([])
                return
            }
            let users = value.compactMap({ (userEntry) -> UserModel? in
                let (key, value) = userEntry
                guard let userUuid = key as? String,
                    let valueDictionary = value as? NSDictionary,
                    let username = valueDictionary["username"] as? String else {
                    return nil
                }
                return UserModel(username: username)
            })
            completion(users)
        })
    }
    
    func removeObservers() {
        Database.database().reference().removeAllObservers()
    }
}
