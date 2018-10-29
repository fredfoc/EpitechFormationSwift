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

enum LoginError: Error {
    case emailIsEmpty
    case emailIsNotValid
    case passwordIsEmpty
    case passwordIsNotValid
}

struct LoginViewModel {
    func createProfile(email:String?, password: String?, completion: ((LoginResult) -> Void)? = nil) {
        do {
            try checkEmailAndPassword(email: email, password: password)
            completion?(.success)
        } catch {
            completion?(.failure(error))
        }
    }
    
    func submitProfile(email:String?, password: String?, completion: ((LoginResult) -> Void)? = nil) {
        do {
            try checkEmailAndPassword(email: email, password: password)
            completion?(.success)
        } catch {
            completion?(.failure(error))
        }
    }
    
    private func checkEmailAndPassword(email: String?, password: String?) throws {
        guard let email = email else {
            throw LoginError.emailIsEmpty
        }
        guard email.isValidEmail else {
            throw LoginError.emailIsNotValid
        }
        guard let password = password else {
            throw LoginError.passwordIsEmpty
        }
        guard password.isValidPassword else {
            throw LoginError.passwordIsNotValid
        }
    }
}
