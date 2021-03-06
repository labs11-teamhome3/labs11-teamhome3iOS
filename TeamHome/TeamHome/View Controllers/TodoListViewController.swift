//
//  TodoListViewController.swift
//  TeamHome
//
//  Created by Ivan Caldwell on 3/28/19.
//  Copyright © 2019 Lambda School under the MIT license. All rights reserved.
//

import UIKit
import Apollo
import Material
import Toucan


// This should be task
struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}


class TodoListViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource, TabBarChildrenProtocol {
    
    @IBAction func filterButtonTapped(_ sender: Any) {
        print("Hello")
    }
    let sortByArray: [String] = ["Date Ascending", "Date Descending", "Creator", "Asignee"]
    let filterByArray: [String] = ["Active", "Complete", "Created by Me", "Assigned to Me", "All"]
    var task: String?
    var todoLists: [OtherFetchAllTodoListQuery.Data.TodoList?]? {
        didSet {
            todolistTableView.reloadData()
        }
    }
    var selectedTodolist: OtherFetchAllTodoListQuery.Data.TodoList?
    // MARK: - Properties
    var apollo: ApolloClient?
    var teamId: GraphQLID?
    var users: [FindTeamByIdQuery.Data.Team.Member?]?
    var team: TeamsByUserQuery.Data.TeamsByUser?
    var currentUser: CurrentUserQuery.Data.User?
    var owners: [TeamsByUserQuery.Data.TeamsByUser?] = []
    var assignees: [TeamsByUserQuery.Data.TeamsByUser?] = []
    // OUTLETS AND ACTIONS
    @IBOutlet weak var todolistNameLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var sortByButton: UIButton!
    @IBOutlet weak var filterByButton: UIButton!
    @IBOutlet weak var filterByTableView: UITableView!
    @IBOutlet weak var sortByTableView: UITableView!
    @IBOutlet weak var detailTableView: UITableView!
    
    @IBOutlet weak var todolistTableView: UITableView!
    // MARK: TODO THIS REPEATED CODE SHOULD CONSOLIDATE INTO ONE FUNCTION...
    @IBAction func filterByButtonTapped(_ sender: Any) {
        animateDropMenu(tableView: filterByTableView)
    }
    
    @IBAction func sortByButtonTapped(_ sender: Any) {
        animateDropMenu(tableView: sortByTableView)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setUpViewAppearance()
        // This gets rid of the empty table cell in the tableView at the bottom.
        //        tableView.tableFooterView = UIView()
        //        tableView.bounces = false
        detailTableView.tableFooterView = UIView()
        todolistTableView.tableFooterView = UIView()

        guard let apollo = apollo
            else { return }
        loadTodoLists(with: apollo)
        loadUsers(with: apollo)
        self.title = "Todos"
        let button = UIButton(frame: CGRect(origin: CGPoint(x: self.view.frame.width - 150, y: self.view.frame.height * 0.8), size: CGSize(width: 125, height: 40)))
        button.backgroundColor = #colorLiteral(red: 0.350115478, green: 0.7936955094, blue: 0.9733197093, alpha: 1)
        button.layer.cornerRadius = button.frame.height * 0.05
        button.setTitle("Create Todo List", for: .normal)
        button.fontSize = 14
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.view.addSubview(button)
        teamNameLabel.text = team?.teamName
        teamNameLabel.textColor = .black
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    @objc func buttonTapped(sender: UIButton!){
        //        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TodoCreationViewController") as UIViewController
        //        // .instantiatViewControllerWithIdentifier() returns AnyObject! this must be downcast to utilize it
        //
        //        self.present(viewController, animated: false, completion: nil)
        performSegue(withIdentifier: "NewTodoSegue", sender: nil)
    }
    
    
    func loadTodoLists(with apollo: ApolloClient) {
        apollo.fetch(query: OtherFetchAllTodoListQuery(teamId: team?.id)) { (result, error) in
            if let error = error {
                NSLog("\(error)")
            }
            guard let result = result,
                let data = result.data else { return }
            self.todoLists = data.todoLists
            for todolist in data.todoLists! {
                print("Todolist ID: \(todolist!.id)")
                print("Todolist Description: \(todolist!.description)")
                print("Todolist Completed: \(todolist!.completed)")
                print()
            }
        }
    }
    
    private func loadUsers(with apollo: ApolloClient) {
        // Get team's id
        guard let team = team,
            //let teamId = team.id else { return }
            let teamId = team.id as String? else { return }
        teamWatcher = apollo.watch(query: FindTeamByIdQuery(id: teamId)) { (result, error) in
            if let error = error {
                NSLog("\(error)")
            }
            guard let result = result,
                let data = result.data else { return }
            let team = data.team
            self.users = team.members
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == detailTableView {
            return selectedTodolist?.todos.count ?? 0
        }
        return todoLists?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == detailTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTaskCell", for: indexPath)
            cell.textLabel?.text = selectedTodolist?.todos[indexPath.row].description
            cell.textLabel?.textColor = .black
            if selectedTodolist?.todos[indexPath.row].completed == true {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            return cell
        }
        if tableView == todolistTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodolistCell", for: indexPath) as! TodolistTableViewCell
            cell.todolist = todoLists?[indexPath.row]
            
            cell.textLabel?.text = todoLists?[indexPath.row]?.description
            cell.textLabel?.textColor = .white
            let numberOfTask = todoLists?[indexPath.row]?.todos.count
            var finishTask = 0
            for task in (todoLists?[indexPath.row]!.todos)! {
                if task.completed == true {
                    finishTask += 1
                }
            }
            cell.detailTextLabel?.text = "\(finishTask) / \(numberOfTask!) Tasks"
            cell.detailTextLabel?.textColor = .white
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodolistCell", for: indexPath)
        //cell.textLabel?.text = todoLists?[indexPath.row]?.description
        cell.textLabel?.text = "Uh oh..."
        cell.textLabel?.textColor = .red
        return cell
        //        }
        //        } else {
        //            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
        //            let todo = todoLists?[indexPath.section]?.todos[indexPath.row - 1]
        //            cell.todo = todo
        //            cell.taskNameLabel?.text = todo?.description
        //            cell.taskNameLabel.textColor = .black
        //            return cell
        //        }
    }
    
    //    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        let sectionHeaderButton = UIButton(type: .custom)
    //        sectionHeaderButton.tag = section
    //        for _ in todoLists! {
    //            sectionHeaderButton.setTitle("", for: .normal)
    //        }
    //        //sectionHeaderButton.addTarget(self, action: #selector(toggleSection), for: .touchUpInside)
    //        return sectionHeaderButton
    //    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == todolistTableView {
            selectedTodolist = todoLists?[indexPath.row]
            todolistNameLabel.text = todoLists?[indexPath.row]?.description
            //todolistNameLabel.textColor = .white
            todolistNameLabel.backgroundColor = #colorLiteral(red: 0.1667489707, green: 0.2231906652, blue: 0.2524917424, alpha: 1)
            detailTableView.reloadData()
        }
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NewTodoSegue" {
            guard let destinationVC = segue.destination as? TodoCreationViewController,
                let apollo = apollo,
                let team = team else { return }
            destinationVC.apollo = apollo
            destinationVC.team = team
            destinationVC.users = users
        }
    }
}
