//
//  HomeViewModel.swift
//  FireBaseProject
//
//  Created by fauquette fred on 29/10/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import Foundation
import Firebase

struct HomeViewModel {
    func logOut(completion: (Bool, Error?) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true, nil)
        } catch {
            completion(false, error)
        }
    }
    
    var displayUserInfo: String? {
        return Auth.auth().currentUser?.uid
    }
}
