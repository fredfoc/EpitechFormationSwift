//
//  FireBaseManager.swift
//  FireBaseProject
//
//  Created by fauquette fred on 12/11/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import Foundation
import Firebase

class FireBaseManager {
    
}

extension FireBaseManager: UserProtocol {
    
    var currentUserUUId: String? {
        return Auth.auth().currentUser?.uid
    }
    
    func getUsers(completion: @escaping ([UserModel]) -> Void) {
        let ref = Database.database().reference().child("users")
        ref.observe(.value, with: { [weak self] snapshot in
            guard let value = snapshot.value as? NSDictionary else {
                completion([])
                return
            }
            let users = value.compactMap({ (userEntry) -> UserModel? in
                let (key, value) = userEntry
                guard let userUuid = key as? String,
                    userUuid != self?.currentUserUUId,
                    let valueDictionary = value as? NSDictionary,
                    let username = valueDictionary["username"] as? String,
                    let online = valueDictionary["online"] as? Bool else {
                        return nil
                }
                return UserModel(username: username, online: online, uuid: userUuid)
            })
            completion(users)
        })
    }
}
