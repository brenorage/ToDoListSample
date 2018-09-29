//
//  ToDoListPresenter.swift
//  ToDoListSample
//
//  Created by Breno Rage Aboud on 29/09/18.
//  Copyright © 2018 Breno Rage Aboud. All rights reserved.
//

import Foundation

class ToDoListPresenter {
    
    private weak var toDoViewProtocol: ToDoListViewProtocol?
    private lazy var userDefaultService = UserDefaultWrapper()
    
    var toDoList: [String]?
    
    init(with viewProtocol: ToDoListViewProtocol) {
        toDoViewProtocol = viewProtocol
    }
}

//MARK: - Protocol methods -
extension ToDoListPresenter: ToDoListPresenterProtocol {
    func changeButtonState(with text: String?) {
        if  let unwrappedText = text,
            !unwrappedText.isEmpty {
            toDoViewProtocol?.enableButton()
        } else {
            toDoViewProtocol?.disableButton()
        }
    }
    
    func saveToDo(with text: String?) {
        toDoViewProtocol?.dismissKeyboard()
        toDoViewProtocol?.clearTextView()
        if  let unwrappedText = text,
            !unwrappedText.isEmpty {
            userDefaultService.appendItem(text, with: userDefaultService.toDoListKey)
            getToDoList()
        }
    }
    
    func deleteToDo(in index: Int) {}
}

//MARK: - Service methods -
extension ToDoListPresenter {
    private func getToDoList() {
        let result: ResultType<[String]> = userDefaultService.get(with: userDefaultService.toDoListKey)
        switch result {
        case let .success(list):
            toDoList = list
            toDoViewProtocol?.showToDoList()
            toDoViewProtocol?.reloadTableView()
        case .failure:
            toDoViewProtocol?.showEmptyList()
        }
    }
}
