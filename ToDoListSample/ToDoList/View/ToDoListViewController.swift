//
//  ToDoListViewController.swift
//  ToDoListSample
//
//  Created by Breno Rage Aboud on 29/09/18.
//  Copyright © 2018 Breno Rage Aboud. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var saveToDoButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func saveToDoAction(_ sender: Any) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}

//MARK: - Setup methods -
extension ToDoListViewController {
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: ToDoCell.self)
    }
}

//MARK: - TableView delegate -
extension ToDoListViewController: UITableViewDelegate {}

//MARK: - TableView data source -
extension ToDoListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: ToDoCell.self, for: indexPath)
        return cell
    }
}
