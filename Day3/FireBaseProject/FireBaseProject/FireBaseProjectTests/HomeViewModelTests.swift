//
//  FireBaseProjectTests.swift
//  FireBaseProjectTests
//
//  Created by fauquette fred on 12/11/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

@testable import FireBaseProject
import XCTest

extension UserProtocol {
    var currentEmail: String? {
        return "fred@fred.com"
    }
}

class FireBaseProjectTests: XCTestCase {
    struct MockFireBaseManagerNoUser: UserProtocol {
        var currentUserUUId: String? {
            return nil
        }
        
        var currentEmail: String? {
            return nil
        }

        func getUsers(completion: @escaping (NSDictionary?) -> Void) {
            completion(nil)
        }
    }

    struct MockFireBaseManagerLogged: UserProtocol {
        var currentUserUUId: String? {
            return "uuid"
        }
        
        var currentEmail: String? {
            return nil
        }

        func getUsers(completion: @escaping (NSDictionary?) -> Void) {
            completion([
                "anotherUuid": [
                    "username": "Fred",
                    "online": true,
                ],
                "uuid": [
                    "username": "Fred",
                    "online": true,
                ],
            ])
        }
    }
    
    struct MockFireBaseManagerLoggedButNoUser: UserProtocol {
        var currentUserUUId: String? {
            return "uuid"
        }
        
        func getUsers(completion: @escaping (NSDictionary?) -> Void) {
            completion(nil)
        }
    }

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetUsersWhenCurrentUserIsLoggedOut() {
        // when user is loggued out => users is nil
        let mockFireBase = MockFireBaseManagerNoUser()
        let homeViewModel = HomeViewModel(userManager: mockFireBase)
        homeViewModel.getUsers { users in
            XCTAssertNil(users)
        }
    }

    func testGetUsersWhenCurrentUserIsLoggedIn() {
        // when user is loggued in
        let mockFireBase = MockFireBaseManagerLogged()
        let homeViewModel = HomeViewModel(userManager: mockFireBase)
        homeViewModel.getUsers { users in
            XCTAssertFalse(users!.isEmpty)
            XCTAssertTrue(users!.count == 1)
        }
    }
    
    func testGetUsersWhenCurrentUserIsLoggedInButNoUser() {
        // when user is loggued in
        let mockFireBase = MockFireBaseManagerLoggedButNoUser()
        let homeViewModel = HomeViewModel(userManager: mockFireBase)
        homeViewModel.getUsers { users in
            XCTAssertTrue(users!.isEmpty)
        }
    }
    
    func testDisplayUserUserLogguedOut() {
        let mockFireBase = MockFireBaseManagerNoUser()
        let homeViewModel = HomeViewModel(userManager: mockFireBase)
        XCTAssertNil(homeViewModel.displayUserInfo)
    }
    
    func testDisplayUserUserLogguedIn() {
        let mockFireBase = MockFireBaseManagerLogged()
        let homeViewModel = HomeViewModel(userManager: mockFireBase)
        XCTAssertNotNil(homeViewModel.displayUserInfo)
    }
}
