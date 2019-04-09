//
//  TaskCreationTableViewCell.swift
//  TeamHome
//
//  Created by Ivan Caldwell on 4/3/19.
//  Copyright © 2019 Lambda School under the MIT license. All rights reserved.
//

import UIKit

class TaskCreationTableViewCell: UITableViewCell {

    @IBOutlet weak var taskTextField: UITextField!
    // Don't think we need an edit button
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var trashButton: UIButton!
    @IBAction func trashButtonTapped(_ sender: Any) {
    }

    
    @IBAction func editButtonTapped(_ sender: Any) {
    }
    
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
