//
//  FireBaseManager.swift
//  FireBaseProject
//
//  Created by fauquette fred on 12/11/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import Firebase
import Foundation

class FireBaseManager {
}

extension FireBaseManager: UserProtocol {
    var currentEmail: String? {
        return Auth.auth().currentUser?.email
    }
    
    var currentUserUUId: String? {
        return Auth.auth().currentUser?.uid
    }

    func getUsers(completion: @escaping (NSDictionary?) -> Void) {
        let ref = Database.database().reference().child("users")
        ref.observe(.value, with: { snapshot in
            guard let value = snapshot.value as? NSDictionary else {
                completion(nil)
                return
            }
            completion(value)
        })
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
    
    func removeObservers() {
        Database.database().reference().removeAllObservers()
    }
}
