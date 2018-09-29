//
//  ToDoListViewProtocol.swift
//  ToDoListSample
//
//  Created by Breno Rage Aboud on 29/09/18.
//  Copyright © 2018 Breno Rage Aboud. All rights reserved.
//

import Foundation

protocol ToDoListViewProtocol: class {
    func reloadTableView()
    func showToDoList()
    func showEmptyList()
    func enableButton()
    func disableButton()
    func dismissKeyboard()
    func clearTextView()
}
