//
//  ToDoListPresenterProtocol.swift
//  ToDoListSample
//
//  Created by Breno Rage Aboud on 29/09/18.
//  Copyright © 2018 Breno Rage Aboud. All rights reserved.
//

import Foundation

protocol ToDoListPresenterProtocol: class {
    var toDoList: [String]? { get }
    func changeButtonState(with text: String?)
    func saveToDo(with text: String?)
    func deleteToDo(in index: Int)
}
