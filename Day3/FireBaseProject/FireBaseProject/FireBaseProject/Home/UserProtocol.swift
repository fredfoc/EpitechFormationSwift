//
//  UserProtocol.swift
//  FireBaseProject
//
//  Created by fauquette fred on 12/11/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import Foundation

protocol UserProtocol {
    var currentUserUUId: String? {get}
    func getUsers(completion: @escaping ([UserModel]) -> Void)
}
