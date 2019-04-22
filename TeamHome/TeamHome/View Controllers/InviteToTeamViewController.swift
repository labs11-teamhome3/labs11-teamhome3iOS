//
//  InviteToTeamViewController.swift
//  TeamHome
//
//  Created by Daniela Parra on 1/11/19.
//  Copyright © 2019 Lambda School under the MIT license. All rights reserved.
//

import UIKit
import Apollo
import Material
import Toucan

class InviteToTeamViewController: UIViewController, UISearchBarDelegate,  UITableViewDelegate, UITableViewDataSource {

    // MARK: - Properties
    var apollo: ApolloClient?
    var teamId: GraphQLID?
    var users: [FetchAllUsersQuery.Data.User?]? = []
    var filterUsers: [FetchAllUsersQuery.Data.User?]? = []
    var filtering = false
    var numberOfUsers: Int = 0 {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailTextField: TextField!
    @IBOutlet weak var phoneNumberTextField: TextField!
    @IBOutlet weak var inviteButton: RaisedButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let apollo = apollo else { return }
        loadUsers(with: apollo)
        setUpViewAppearance()
        //emailTextField.dividerActiveColor = Appearance.yellowColor
        //emailTextField.placeholderActiveColor = Appearance.yellowColor
        //emailTextField.textColor = .white
        //phoneNumberTextField.dividerActiveColor = Appearance.yellowColor
            //phoneNumberTextField.placeholderActiveColor = Appearance.yellowColor
        //phoneNumberTextField.textColor = .white
        //inviteButton.backgroundColor = Appearance.darkMauveColor
        

        searchBar.delegate = self
        self.tableView.tableFooterView = UIView()
    }

    
    private func loadUsers(with apollo: ApolloClient) {
        apollo.fetch(query: FetchAllUsersQuery()) { (result, error) in
            if let error = error {
                NSLog("\(error)")
            }
            
            guard let result = result,
                let data = result.data else { return }
            //self.users = []
            //print(result)
            for user in data.users! {
                if ((user?.email) != nil) {
                    self.numberOfUsers += 1
                    self.users?.append(user)
                    //print(user!.name as! String)
                    //print(user!.email as! String)
                }
            }
            print("numUsers: \(self.numberOfUsers)")
        }
        self.tableView.reloadData()
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Binary operator '==' cannot be applied to operands of type 'String.SubSequence?' (aka 'Optional<Substring>') and 'String'
        if searchBar.text == nil || searchBar.text == "" {
            filtering = false
        } else {
            //filterUsers = users!.filter({$0!.name!.prefix(searchText.count) == searchText})
            filterUsers = users!.filter({$0!.name!.lowercased().prefix(searchText.count) == searchText.lowercased()})
            // That's right I'm killing kittens.
            filtering = true
        }
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filtering {
            return filterUsers?.count ?? users!.count
        } else {
            return users!.count
        }
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath)
        cell.textLabel?.text = users?[indexPath.row]?.name
        print(users![indexPath.row]!.name)
        cell.detailTextLabel?.text = users?[indexPath.row]?.email
        
        if let avatar = users?[indexPath.row]?.profilePic {
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
        return cell
    }
    
    
    /*
     The previous mutation was deleted. Available team members are all list in on place
     and the user picks and adds team members from a drop box, or search for additional team
     members thru a  search box...
     */
    
    /*
    @IBAction func inviteToTeam(_ sender: Any) {
        guard let apollo = apollo,
            let teamId = teamId,
            let email = emailTextField.text,
            let phoneNumber = phoneNumberTextField.text else { return }
     
        if phoneNumber == "" {
            apollo.perform(mutation: InviteUserToTeamWithEmailMutation(id: teamId, email: email), queue: DispatchQueue.global()) { (result, error) in
                if let error = error {
                    NSLog("\(error)")
                    return
                }

                guard let result = result else { return }

                if let errors = result.errors {
                    let errorDescription = errors[0].localizedDescription
                    DispatchQueue.main.async {
                        self.emailTextField.text = ""

                        let alert = UIAlertController(title: "Error", message: errorDescription, preferredStyle: .alert)

                        self.present(alert, animated: true, completion: nil)

                        let when = DispatchTime.now() + 2
                        DispatchQueue.main.asyncAfter(deadline: when){

                            alert.dismiss(animated: true, completion: nil)
                        }

                    }
                }

                guard let data = result.data,
                    let user = data.inviteUser else { return }

                print(user)

                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Invitation Sent", message: "The team is getting bigger!", preferredStyle: .alert)
                    self.present(alert, animated: true, completion: nil)
                    let when = DispatchTime.now() + 2
                    DispatchQueue.main.asyncAfter(deadline: when){
                        alert.dismiss(animated: true, completion: nil)
                    }
                }

                teamWatcher?.refetch()
            }

        } else if email == "" {
            apollo.perform(mutation: InviteUserToTeamWithPhoneMutation(id: teamId, phoneNumber: phoneNumber), queue: DispatchQueue.global()) { (result, error) in
                if let error = error {
                    NSLog("\(error)")
                    return
                }

                guard let result = result else { return }

                if let errors = result.errors {
                    let errorDescription = errors[0].localizedDescription
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Error", message: errorDescription, preferredStyle: .alert)

                        self.present(alert, animated: true, completion: nil)

                        let when = DispatchTime.now() + 2
                        DispatchQueue.main.asyncAfter(deadline: when){
                            alert.dismiss(animated: true, completion: nil)
                        }
                    }
                }
                guard let data = result.data,
                    let user = data.inviteUser else { return }
                print(user)

                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Invitation Sent", message: "The team is getting bigger!", preferredStyle: .alert)

                    self.present(alert, animated: true, completion: nil)

                    let when = DispatchTime.now() + 2
                    DispatchQueue.main.asyncAfter(deadline: when){

                        alert.dismiss(animated: true, completion: nil)
                    }
                }
                teamWatcher?.refetch()
            }
        }
    }
*/
}
