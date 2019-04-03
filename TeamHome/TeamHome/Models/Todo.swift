//
//  Todo.swift
//  TeamHome
//
//  Created by Iyin Raphael on 3/28/19.
//  Copyright © 2019 Lambda School under the MIT license. All rights reserved.
//

import Foundation


struct Todo {
    let id: UUID
    var description: String
    var partOf: TodoList?
    var completed: Bool
}

struct TodoList {
    let id: UUID
    let createdAt: Date
    var description: String
    var ownedBy: [User]
    var assignedTo: [User]
    var todos: [Todo]
    var completed: Bool
    var inTeam: Team?
    
    
    init(todoList: TodoList){
        
    }
}
