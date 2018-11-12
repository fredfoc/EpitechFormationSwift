//
//  UserModel.swift
//  FireBaseProject
//
//  Created by fauquette fred on 12/11/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import Foundation

struct UserModel {
    let username: String
    let online: Bool
    let uuid: String

    var displayName: String {
        return username + (online ? " (online)." : " (offline).")
    }
}
