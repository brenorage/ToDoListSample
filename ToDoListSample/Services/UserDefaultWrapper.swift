//
//  UserDefaultWrapper.swift
//  ToDoListSample
//
//  Created by Breno Rage Aboud on 29/09/18.
//  Copyright © 2018 Breno Rage Aboud. All rights reserved.
//

import Foundation

class UserDefaultWrapper {
    let toDoListKey = "ToDoListKey"
    private let defaults = UserDefaults.standard
    
    func get<T>(with key: String) -> ResultType<T> {
        let data = defaults.object(forKey: key)
        if let unwrappedData = data as? T {
            return .success(unwrappedData)
        } else {
            return .failure
        }
    }
    
    func appendItem<T>(_ data: T, with key: String) {
        let result: ResultType<[T]> = get(with: key)
        switch result {
        case let .success(array):
            var recoveryArray = array
            recoveryArray.append(data)
            defaults.set(recoveryArray, forKey: key)
        default:
            defaults.set([data], forKey: key)
        }
        
    }
}
