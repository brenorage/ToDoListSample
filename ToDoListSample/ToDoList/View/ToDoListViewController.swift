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

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
