//
//  FireBaseManager.swift
//  FireBaseProject
//
//  Created by fauquette fred on 11/11/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import Firebase
import Foundation

enum FireBaseUsersResult {
    case success([User])
    case failure(Error)
}

enum FireBaseUsersResultError: Error {
    case noUsers
}

class FireBaseManager {
    fileprivate lazy var ref: DatabaseReference? = {
        Database.database().reference()
    }()
}

extension FireBaseManager: UserProtocol {
    func removeObserver() {
        ref?.removeAllObservers()
    }

    func registerForChange(completion: @escaping (FireBaseUsersResult) -> Void) {
        ref?.child("users").observe(.value, with: { [weak self] snapshot in
            guard let result = self?.getUsers(from: snapshot) else {
                return completion(.failure(FireBaseUsersResultError.noUsers))
            }
            completion(result)
        })
    }

    func getUsers(completion: @escaping (FireBaseUsersResult) -> Void) {
        ref?.child("users").observeSingleEvent(of: .value, with: { [weak self] snapshot in
            guard let result = self?.getUsers(from: snapshot) else {
                return completion(.failure(FireBaseUsersResultError.noUsers))
            }
            completion(result)
        })
    }

    var displayUserInfo: String? {
        return Auth.auth().currentUser?.uid
    }

    private func getUsers(from snapshot: DataSnapshot) -> FireBaseUsersResult {
        guard let usersValues = snapshot.value as? NSDictionary else {
            return .failure(FireBaseUsersResultError.noUsers)
        }
        let users = usersValues.compactMap({ (arg0) -> User? in
            let (key, value) = arg0
            guard let uuid = key as? String,
                let values = value as? NSDictionary,
                let userName = values["username"] as? String,
                let isOnline = values["online"] as? Bool else {
                return nil
            }
            return User(username: userName,
                        uuid: uuid,
                        isOnline: isOnline)
        })
        return .success(users)
    }

    func registerUser() {
        guard let currentUser = Auth.auth().currentUser, let displayName = currentUser.displayName ?? currentUser.email else {
            return
        }
        ref?.child("users").child(currentUser.uid).setValue([
            "username": displayName,
            "online": true,
        ])
    }

    func logOut(completion: (Bool, Error?) -> Void) {
        removeObserver()
        guard let currentUser = Auth.auth().currentUser else {
            return
        }
        ref?.child("users").child(currentUser.uid).updateChildValues(["online": false])
        do {
            try Auth.auth().signOut()
            completion(true, nil)
        } catch {
            completion(false, error)
        }
    }
}
