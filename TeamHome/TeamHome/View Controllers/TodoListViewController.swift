//
//  TodoListViewController.swift
//  TeamHome
//
//  Created by Ivan Caldwell on 3/28/19.
//  Copyright © 2019 Lambda School under the MIT license. All rights reserved.
//

import UIKit
import UIKit
import Apollo
import Cloudinary
import GrowingTextView
import Toucan
import Material
import Photos


// This should be task
struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
    var completed: Bool = false
    var date = Date()
    // var owner = self... user
}
// Todo should be composed of Tasks == Todo: [Task]
// Todos should be composed of Todo == Todos: [Todos]

class TodoListViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource {
    let sortByArray: [String] = ["Date Ascending", "Date Descending", "Creator", "Asignee"]
    let filterByArray: [String] = ["Active", "Complete", "Created by Me", "Assigned to Me", "All"]
    static var tasks: [String] = []
    var task: String?
    var tableViewData: [cellData] = []
    
    var apollo: ApolloClient?
    var currentUser: CurrentUserQuery.Data.CurrentUser?
    var team: FindTeamsByUserQuery.Data.FindTeamsByUser?
    
    // Need to get the team members
    // Need to get todos
    // OUTLETS AND ACTIONS
    @IBOutlet weak var sortByButton: UIButton!
    @IBOutlet weak var filterByButton: UIButton!
    @IBOutlet weak var filterByTableView: UITableView!
    @IBOutlet weak var sortByTableView: UITableView!
    @IBOutlet weak var todosTableView: UITableView!
    
    
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
        setUpViewAppearance()
        createGradientLayer()
        filterByTableView.isHidden = true
        sortByTableView.isHidden = true
        tableViewData.append(cellData(opened: false, title: "Front End", sectionData: ["Update Auth0", "Build activity view", "Build document view"]))
        tableViewData.append(cellData(opened: false, title: "Back End", sectionData: ["Update API", "Auth0 Sign-In", "Payment Modal"]))
        tableViewData.append(cellData(opened: false, title: "iOS", sectionData: ["Update UI", "Auth0 Sign-In"]))
        // This gets rid of the empty table cell in the tableView at the bottom.
        todosTableView.tableFooterView = UIView()
        self.navigationItem.title = team?.name
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == todosTableView {
            return tableViewData.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == filterByTableView {
            return filterByArray.count
        }
        if tableView == sortByTableView {
            return sortByArray.count
        }
        if tableView == todosTableView {
            if tableViewData[section].opened == true {
                return tableViewData[section].sectionData.count + 1
            }
        }
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == todosTableView {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
                cell.textLabel?.text = tableViewData[indexPath.section].title
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
                cell.taskNameLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row - 1]
                return cell
            }
        }
        if tableView == sortByTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SortByCell", for: indexPath)
            cell.textLabel?.text = sortByArray[indexPath.row]
            return cell
        } else {
            // tableView == filterByTableView
            let cell = tableView.dequeueReusableCell(withIdentifier: "FilterStatusCell", for: indexPath)
            cell.textLabel?.text = filterByArray[indexPath.row]
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == sortByTableView {
            sortByButton.setTitle("\(sortByArray[indexPath.row])", for: .normal)
            animateDropMenu(tableView: sortByTableView)
        } else if tableView == filterByTableView {
            filterByButton.setTitle("\(filterByArray[indexPath.row])", for: .normal)
            animateDropMenu(tableView: filterByTableView)
        } else {
            if tableView == todosTableView {
                if tableViewData[indexPath.section].opened == true {
                    tableViewData[indexPath.section].opened = false
                    let sections = IndexSet.init(integer: indexPath.section)
                    tableView.reloadSections(sections, with: .none)
                } else {
                    tableViewData[indexPath.section].opened = true
                    let sections = IndexSet.init(integer: indexPath.section)
                    tableView.reloadSections(sections, with: .none)
                }
            }
        }
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "TodoSegue" {
            let detailVC = segue.destination as! TodoCreationViewController
            detailVC.tableViewData = tableViewData
        }
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        
    }
    
    private var gradientLayer: CAGradientLayer!
    // MARK: - Private Functions
    // Create gradient layer for view background.
    private func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [Appearance.grayColor.cgColor, Appearance.likeGrayColor.cgColor, Appearance.grayColor.cgColor]
        gradientLayer.locations = [0.0, 0.5]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
