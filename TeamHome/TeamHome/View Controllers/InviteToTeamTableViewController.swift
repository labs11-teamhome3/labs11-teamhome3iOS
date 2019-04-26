//
//  InviteToTeamTableViewController.swift
//  TeamHome
//
//  Created by Ivan Caldwell on 4/22/19.
//  Copyright © 2019 Lambda School under the MIT license. All rights reserved.
//

import UIKit
import Apollo
import Material
import Toucan

struct selectedTeamMembers {
    var member: FetchAllUsersQuery.Data.User?
    var selected: Bool = false
    init(member: FetchAllUsersQuery.Data.User?) {
        self.member = member
    }
}

class InviteToTeamTableViewController: UITableViewController, UISearchBarDelegate {

    // MARK: - Properties
    var apollo: ApolloClient?
    
    var teamId: GraphQLID?
    var users: [FetchAllUsersQuery.Data.User?]? = []
    var filtering = false
    //var filterUsers: [FetchAllUsersQuery.Data.User?]? = []
    var members: [selectedTeamMembers] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    var filterMembers: [selectedTeamMembers] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let apollo = apollo else { return }
        loadUsers(with: apollo)
        //setUpViewAppearance()
        let cancelBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(clickedCancelButton))
        let saveBarButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(clickedSaveButton))
        navigationItem.leftBarButtonItem = cancelBarButton
        navigationItem.rightBarButtonItem = saveBarButton
        navigationItem.title = "Add Team Members"
        searchBar.delegate = self
        tableView.bounces = false
        self.tableView.tableFooterView = UIView()
    }

    func loadUsers(with apollo: ApolloClient) {
        apollo.fetch(query: FetchAllUsersQuery()) { (result, error) in
            if let error = error {
                NSLog("\(error)")
            }
            guard let result = result,
                let data = result.data else { return }
            for user in data.users! {
                if ((user?.email) != nil) {
                    self.members.append(selectedTeamMembers(member: user))
                    print(user!.name!)
                }
            }
        }
        self.tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            filtering = false
        } else {
            filtering = true
            filterMembers = members.filter({$0.member!.name!.lowercased().contains(searchText.lowercased())})
            // That's right I'm killing kittens.
        }
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filtering {
            return filterMembers.count
        } else {
            return members.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath)
        let user = (filtering == true) ? filterMembers[indexPath.row] : members[indexPath.row]
        cell.textLabel?.text = user.member?.name
        cell.textLabel?.textColor = .black
        cell.detailTextLabel?.textColor = .black
        cell.detailTextLabel?.text = user.member?.email
        if let avatar = user.member?.profilePic {
            cloudinary.createDownloader().fetchImage(avatar, { (progress) in
            }) { (image, error) in
                if let error = error {
                    NSLog("\(error)")
                    return
                }
                guard let image = image else { return }
                let resizedImage = Toucan.init(image: image).resize(CGSize(width: 50, height: 50), fitMode: .crop).maskWithEllipse()
                DispatchQueue.main.async {
                    cell.imageView?.image = resizedImage.image
                }
            }
        }
        if user.selected == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        if !filtering {
            //var user = (filtering == false) ? users[(indexPath?.row)!] : filterUsers?[indexPath!.row]
            var user = members[(indexPath?.row)!]
            let cell = tableView.cellForRow(at: indexPath!) as! UITableViewCell
            print("Before: \(user.selected)")
            user.selected = !user.selected
            print("After: \(user.selected)")
            if user.selected {
                cell.accessoryType = .checkmark
                members[(indexPath?.row)!].selected = true
            } else {
                cell.accessoryType = .none
                members[(indexPath?.row)!].selected = false
            }
        } else {
            var user = filterMembers[(indexPath?.row)!]
            let cell = tableView.cellForRow(at: indexPath!) as! UITableViewCell
            user.selected = !user.selected
            print("Filtering Before: \(user.selected)")
            print("Filtering After: \(user.selected)")
            if user.selected {
                cell.accessoryType = .checkmark
                filterMembers[(indexPath?.row)!].selected = true
            } else {
                cell.accessoryType = .none
                filterMembers[(indexPath?.row)!].selected = false
            }
            let index: Int = members.firstIndex { $0.member?.email  == user.member?.email}!
            print(index)
            members[index].selected = user.selected
        }
        tableView.reloadData()
    }
    
    @objc func clickedCancelButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func clickedSaveButton() {
        navigationController?.popViewController(animated: true)
        for user in members {
            if user.selected {
                print( user.member!.name)
                print( user.member!.email)
                print()
                apollo?.perform(mutation: AddUserToTeamMutation(teamId: teamId!, userId: user.member!.id), queue: DispatchQueue.global()) { (result, error) in
                    if let error = error {
                        NSLog("\(error)")
                        return
                    }
                }
            }
        }
    }
}
