//
//  ToDoCell.swift
//  ToDoListSample
//
//  Created by Breno Rage Aboud on 29/09/18.
//  Copyright © 2018 Breno Rage Aboud. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet private weak var toDoLabel: UILabel!
    
    var toDo: String? {
        didSet {
            toDoLabel.text = toDo
        }
    }
}
