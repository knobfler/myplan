//
//  SharedAuth.swift
//  MyPlan
//
//  Created by 최동호 on 2018. 4. 7..
//  Copyright © 2018년 최동호. All rights reserved.
//

import Foundation

class SharedAuth {
    static let shared = SharedAuth()
    
    var isAuthenticated: Bool = false
}
