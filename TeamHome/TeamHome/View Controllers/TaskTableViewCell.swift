//
//  TaskTableViewCell.swift
//  TeamHome
//
//  Created by Ivan Caldwell on 4/2/19.
//  Copyright © 2019 Lambda School under the MIT license. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var taskCheckboxButton: UIButton!
    @IBAction func taskCheckBoxButtonTapped(_ sender: UIButton) {
        // Build a toggle checkbox, if task is completed or not...
        if sender.currentImage == UIImage(named: "Unchecked Checkbox") {
            sender.setImage(UIImage(named: "Checked Checkbox"), for: .normal)
            // MARK: TODO Add some code to update task as being completed...
        } else {
            sender.setImage(UIImage(named: "Unchecked Checkbox"), for: .normal)
            // MARK: TODO Add some code to change task to being not completed...
        }
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
