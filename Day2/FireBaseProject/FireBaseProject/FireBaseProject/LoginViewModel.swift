//
//  LoginViewModel.swift
//  FireBaseProject
//
//  Created by fauquette fred on 29/10/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import Foundation

enum LoginResult {
    case success
    case failure(Error)
}

struct LoginViewModel {
    func createProfile(email:String?, password: String?, completion: ((LoginResult) -> Void)? = nil) {
        
    }
    
    func submitProfile(email:String?, password: String?, completion: ((LoginResult) -> Void)? = nil) {
        
    }
}
