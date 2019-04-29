//
//  TodoCreationViewController.swift
//  TeamHome
//
//  Created by Ivan Caldwell on 3/28/19.
//  Copyright © 2019 Lambda School under the MIT license. All rights reserved.
//

import UIKit
import Apollo
import Cloudinary


class TodoCreationViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource, UITextFieldDelegate, TabBarChildrenProtocol {
    
    var todos: [String]?
    var apollo: ApolloClient?
    var teamId: GraphQLID?
    var users: [FindTeamByIdQuery.Data.Team.Member?]?
    var team: TeamsByUserQuery.Data.TeamsByUser?
    var currentUser: CurrentUserQuery.Data.User?
    var tasks: [String] = [] {
        didSet {
            self.tableView.reloadData()
            print("Tasks count: \(tasks.count)")
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var todolistTextField: UITextField!
    @IBAction func addTaskButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Enter a task.", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Task description"
        })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            if let task = alert.textFields?.first?.text {
                print("Task name: \(task)")
                self.tasks.append(task)

            }
        }))
        self.present(alert, animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
        //        for user in members {
        //            if user.selected {
        //                print( user.member!.name)
        //                print( user.member!.email)
        //                print()
        //                apollo?.perform(mutation: AddUserToTeamMutation(teamId: teamId!, userId: user.member!.id), queue: DispatchQueue.global()) { (result, error) in
        //                    if let error = error {
        //                        NSLog("\(error)")
        //                        return
        //                    }
        //                }
        //            }
        //        }
        if todolistTextField.text == nil || todolistTextField.text == "" {
            // Print a warning || alert box
            
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamNameLabel.text = team?.teamName
        teamNameLabel.textColor = .black
        titleLabel.textColor = .black
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        navigationItem.hidesBackButton  = true
        
    }
    
    func animateDropMenu( tableView: UITableView) {
        if tableView.isHidden {
            UIView.animate(withDuration: 0.3) {
                tableView.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                tableView.isHidden = true
            }
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        cell.textLabel?.textColor = .black
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    // MARK: - Private Functions
    // Create gradient layer for view background.
    private var gradientLayer: CAGradientLayer!
    private func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [Appearance.darkBlueColor.cgColor, Appearance.lightGrayColor.cgColor, Appearance.darkBlueColor.cgColor]
        gradientLayer.locations = [0.0, 0.5]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AssignMembers" {
            guard let destinationVC = segue.destination as? TeamMembersViewController,
                let apollo = apollo,
                let team = team else { return }
            destinationVC.apollo = apollo
            destinationVC.team = team
            destinationVC.users = users
        } else if segue.identifier == "AssignOwners" {
            guard let destinationVC = segue.destination as? TeamOwnersViewController,
                let apollo = apollo,
                let team = team else { return }
            destinationVC.apollo = apollo
            destinationVC.team = team
            destinationVC.users = users
        }
    }
}
