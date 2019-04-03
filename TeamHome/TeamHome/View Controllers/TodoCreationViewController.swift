//
//  TodoCreationViewController.swift
//  TeamHome
//
//  Created by Ivan Caldwell on 3/28/19.
//  Copyright © 2019 Lambda School under the MIT license. All rights reserved.
//

import UIKit

class TodoCreationViewController: UIViewController {
    var todos: [String]?
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func unwindToTodoList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? TodoListViewController {
            // Update TodoList Array...
            // Append to TodoList To TodoLists
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
