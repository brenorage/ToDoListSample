//
//  ToDoListViewController.swift
//  ToDoListSample
//
//  Created by Breno Rage Aboud on 29/09/18.
//  Copyright © 2018 Breno Rage Aboud. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController {
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var saveToDoButton: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var emptyView: UILabel!
    
    @IBAction private func saveToDoAction(_ sender: Any) { presenter.saveToDo(with: textView.text) }
    
    private lazy var presenter: ToDoListPresenterProtocol = ToDoListPresenter(with: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupTextView()
        disableButton()
        presenter.getToDoList()
    }
}

//MARK: - Setup methods -
extension ToDoListViewController {
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: ToDoCell.self)
    }
    
    private func setupTextView() {
        textView.delegate = self
    }
}

//MARK: - View protocol methods -
extension ToDoListViewController: ToDoListViewProtocol {
    func reloadTableView() {
        tableView.reloadSections(IndexSet(0...0), with: .automatic)
    }
    
    func showToDoList() {
        UIView.animate(withDuration: 0.3) {
            self.tableView.isHidden = false
            self.emptyView.isHidden = true
        }
    }
    
    func showEmptyList() {
        UIView.animate(withDuration: 0.3) {
            self.tableView.isHidden = true
            self.emptyView.isHidden = false
        }
    }
    
    func enableButton() {
        saveToDoButton.isEnabled = true
        saveToDoButton.alpha = 1
    }
    
    func disableButton() {
        saveToDoButton.isEnabled = false
        saveToDoButton.alpha = 0.5
    }
    
    func dismissKeyboard() {
        textView.endEditing(true)
    }
    
    func clearTextView() {
        textView.text = ""
        presenter.changeButtonState(with: textView.text)
    }
}

//MARK: - TableView delegate -
extension ToDoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Apagar") { _,_,_ in
            self.presenter.deleteToDo(in: indexPath.row)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

//MARK: - TableView data source -
extension ToDoListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.toDoList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let list = presenter.toDoList else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(with: ToDoCell.self, for: indexPath)
        cell.toDo = list[indexPath.row]
        return cell
    }
}

//MARK: - TextView delegate methods -
extension ToDoListViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        presenter.changeButtonState(with: textView.text)
    }
}
