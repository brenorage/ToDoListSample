//
//  ResultType.swift
//  ToDoListSample
//
//  Created by Breno Rage Aboud on 29/09/18.
//  Copyright © 2018 Breno Rage Aboud. All rights reserved.
//

import Foundation

enum ResultType<T> {
    case success(T)
    case failure
}
