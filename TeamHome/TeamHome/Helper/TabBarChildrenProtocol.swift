//
//  TabBarChildrenProtocol.swift
//  TeamHome
//
//  Created by Daniela Parra on 1/10/19.
//  Copyright © 2019 Lambda School under the MIT license. All rights reserved.
//

import Apollo

protocol TabBarChildrenProtocol: class {
    var team: TeamsByUserQuery.Data.TeamsByUser? { get set }
    var apollo: ApolloClient? { get set }
    var currentUser: CurrentUserQuery.Data.User? { get set }
}
