//
//  TodolistTableViewCell.swift
//  TeamHome
//
//  Created by Ivan Caldwell on 4/29/19.
//  Copyright © 2019 Lambda School under the MIT license. All rights reserved.
//

import UIKit

class TodolistTableViewCell: UITableViewCell {

    var todolist: OtherFetchAllTodoListQuery.Data.TodoList?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
}
