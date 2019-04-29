//
//  TeamMembersViewController.swift
//  TeamHome
//
//  Created by Ivan Caldwell on 4/26/19.
//  Copyright © 2019 Lambda School under the MIT license. All rights reserved.
//

import UIKit
import Apollo
import Cloudinary
import Toucan

class TeamMembersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var todos: [String]?
    let teamMemberArray: [String] = ["Tom", "Dick", "Harry", "Me"]
    var apollo: ApolloClient?
    var teamId: GraphQLID?
    var users: [FindTeamByIdQuery.Data.Team.Member?]? {
        didSet {
            print("Value changed")
            if isViewLoaded {
                self.tableView.reloadData()
            }
        }
    }
    
    var team: TeamsByUserQuery.Data.TeamsByUser?
    var currentUser: CurrentUserQuery.Data.User?
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
        for user in users! {
            print (user?.name)
        }
        teamNameLabel.textColor = .black
        teamNameLabel.text = team?.teamName
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(users?.count)
        return users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AssignedCell", for: indexPath)
        cell.textLabel?.text = users?[indexPath.row]?.name
        cell.textLabel?.textColor = .black
        cell.detailTextLabel?.textColor = .black
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let cell = tableView.cellForRow(at: indexPath!)
        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
        } else {
            cell?.accessoryType = .checkmark
        }
        tableView.reloadData()
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //var width_calc = self.view.frame.width
        //tableView.frame = CGRect(center: CGPoint(x: self.view.frame.height / 8, y: self.view.frame.width / 2), size: CGSize(width: 100, height: 30 * teamMemberArray.count))
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
