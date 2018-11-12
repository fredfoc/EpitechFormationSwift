//
//  String+Password.swift
//  FireBaseProject
//
//  Created by fauquette fred on 29/10/2018.
//  Copyright © 2018 MotoTomo. All rights reserved.
//

import Foundation

extension String {
    var isValidPassword: Bool {
        return self.count >= 7
    }
}
