//
//  LoginViewModel.swift
//  FireBaseProject
//
//  Created by fauquette fred on 29/10/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import Firebase
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
    var userIsLogged: Bool {
        return Auth.auth().currentUser != nil
    }

    func checkIfUserIsLogged() -> Bool {
        return Auth.auth().currentUser != nil
    }

    func createProfile(email: String?, password: String?, completion: ((LoginResult) -> Void)? = nil) {
        do {
            let (email, password) = try checkEmailAndPassword(email: email, password: password)
            Auth.auth().createUser(withEmail: email,
                                   password: password) { _, error in
                if let error = error {
                    completion?(.failure(error))
                    return
                }
                completion?(.success)
            }
        } catch {
            completion?(.failure(error))
        }
    }

    func submitProfile(email: String?, password: String?, completion: ((LoginResult) -> Void)? = nil) {
        do {
            let (email, password) = try checkEmailAndPassword(email: email, password: password)
            Auth.auth().signIn(withEmail: email,
                               password: password) { _, error in
                if let error = error {
                    completion?(.failure(error))
                    return
                }
                completion?(.success)
            }
        } catch {
            completion?(.failure(error))
        }
    }

    private func checkEmailAndPassword(email: String?, password: String?) throws -> (email: String, password: String) {
        guard let email = email, !email.isEmpty else {
            throw LoginError.emailIsEmpty
        }
        guard email.isValidEmail else {
            throw LoginError.emailIsNotValid
        }
        guard let password = password, !password.isEmpty else {
            throw LoginError.passwordIsEmpty
        }
        guard password.isValidPassword else {
            throw LoginError.passwordIsNotValid
        }
        return (email: email, password: password)
    }
}
