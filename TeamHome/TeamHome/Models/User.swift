//
//  User.swift
//  TeamHome
//
//  Created by Daniela Parra on 1/10/19.
//  Copyright © 2019 Lambda School under the MIT license. All rights reserved.
//

import Foundation

struct User: Decodable {
    let given_name: String
    let family_name: String
    let name:String
    let email: String
    let sub: String
    //let phoneNumber: String
    //let picture: String //or URL?
    //let receiveEmails: Bool
    //let receiveTexts: Bool
}
