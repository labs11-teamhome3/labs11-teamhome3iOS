//
//  SearchUserTableViewCell.swift
//  Checklist
//
//  Created by Ivan Caldwell on 4/18/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

import UIKit

class SearchUserTableViewCell: UITableViewCell {

    
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var userNameLabel: UILabel!
    var checked: Bool = false

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
