//
//  UserProtocol.swift
//  FireBaseProject
//
//  Created by fauquette fred on 12/11/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import Foundation

protocol UserProtocol {
    var currentUserUUId: String? { get }
    var currentEmail: String? { get }
    func getUsers(completion: @escaping (NSDictionary?) -> Void)
    func logIn()
    func logOut(completion: (Bool, Error?) -> Void)
    func removeObservers()
}
