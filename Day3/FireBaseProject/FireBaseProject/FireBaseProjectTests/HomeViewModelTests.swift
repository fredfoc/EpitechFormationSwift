//
//  FireBaseProjectTests.swift
//  FireBaseProjectTests
//
//  Created by fauquette fred on 12/11/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import XCTest
@testable import FireBaseProject

class FireBaseProjectTests: XCTestCase {
    
    struct MockFireBaseManager: UserProtocol {
        var currentUserUUId: String? {
            return nil
        }
        func getUsers(completion: @escaping ([UserModel]) -> Void) {}
    }
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetUsers() {
        // when user is loggued out
        let mockFireBase = MockFireBaseManager()
        let homeViewModel = HomeViewModel(userManager: mockFireBase)
        // main user is logged (impossible to check)
        homeViewModel.getUsers { (users) in
            XCTAssertTrue(users.isEmpty)
        }
    }
}
