//
//  TodoCreationViewController.swift
//  TeamHome
//
//  Created by Ivan Caldwell on 3/28/19.
//  Copyright © 2019 Lambda School under the MIT license. All rights reserved.
//


//struct cellData {
//    var opened = Bool()
//    var title = String()
//    var sectionData = [String]()
//}

import UIKit

class TodoCreationViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource {
    var todos: [String]?
    let teamMemberArray: [String] = ["Nick", "Daniel", "Iyin", "Yanna", "Kevin", "Clint", "Me"]
    var tableViewData: [cellData]!
    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var listNameTextField: UITextField!
    @IBOutlet weak var taskTextField: UITextField!
    
    
    @IBOutlet weak var assignTopLeftButton: UIButton!
    @IBOutlet weak var assignTopLeftTableView: UITableView!
    @IBOutlet weak var assignTopRightButton: UIButton!
    @IBOutlet weak var assignTopRightTableView: UITableView!
    @IBOutlet weak var assignBottomLeftButton: UIButton!
    @IBOutlet weak var assignBottomLeftTableView: UITableView!
    @IBOutlet weak var assignButtomRightButton: UIButton!
    @IBOutlet weak var assignBottomRightTableView: UITableView!
    @IBOutlet weak var ownerLeftButton: UIButton!
    @IBOutlet weak var ownerRightButton: UIButton!
    @IBOutlet weak var ownerRightTableView: UITableView!
    @IBOutlet weak var ownerLeftTableView: UITableView!
    @IBOutlet weak var saveButtonTapped: UIBarButtonItem!
    @IBAction func saveButtonTapped(_ sender: Any) {
        tableViewData.append(cellData(opened: false, title: listNameTextField.text!, sectionData: [taskTextField.text!]))
    }
    
    
    @IBAction func ownerLeftButtonTapped(_ sender: Any) {
        animateDropMenu(tableView: ownerLeftTableView)
    }
    @IBAction func ownerRightButtonTapped(_ sender: Any) {
        animateDropMenu(tableView: ownerRightTableView)
    }
    @IBAction func assignTopLeftButtonTapped(_ sender: Any) {
        animateDropMenu(tableView: assignTopLeftTableView)
    }
    
    @IBAction func assignTopRightButtonTapped(_ sender: Any) {
        animateDropMenu(tableView: assignTopRightTableView)
    }
    
    @IBAction func assignBottomLeftButtonTapped(_ sender: Any) {
        animateDropMenu(tableView: assignBottomLeftTableView)
    }
    
    @IBAction func assignButtomRightButtonTapped(_ sender: Any) {
        animateDropMenu(tableView: assignBottomRightTableView)
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
        navigationController?.popViewController(animated: true)
    }
    
//    @IBAction func unwindToTodoList(sender: UIStoryboardSegue) {
//        if let sourceViewController = sender.source as? TodoListViewController {
//            // Update TodoList Array...
//            // Append to TodoList To TodoLists
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewAppearance()
        createGradientLayer()
        // Do any additional setup after loading the view.
        assignTopLeftTableView.isHidden = true
        assignTopRightTableView.isHidden = true
        assignBottomLeftTableView.isHidden = true
        assignBottomRightTableView.isHidden = true
        ownerLeftTableView.isHidden = true
        ownerRightTableView.isHidden = true
        taskTableView.tableFooterView = UIView()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == assignTopLeftTableView || tableView == assignTopRightTableView || tableView == assignBottomLeftTableView || tableView == assignBottomRightTableView || tableView == ownerLeftTableView || tableView == ownerRightTableView {
            return teamMemberArray.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == assignTopLeftTableView || tableView == assignTopRightTableView || tableView == assignBottomLeftTableView || tableView == assignBottomRightTableView || tableView == ownerLeftTableView || tableView == ownerRightTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TeamMemberCell", for: indexPath)
            cell.textLabel?.text = teamMemberArray[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskItemCell", for: indexPath) //as! TaskTableViewCell
            // cell.textLabel?.text = "Logical Error"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == assignTopLeftTableView {
            assignTopLeftButton.setTitle("\(teamMemberArray[indexPath.row])", for: .normal)
            animateDropMenu(tableView: assignTopLeftTableView)
        } else if tableView == assignTopRightTableView {
            assignTopRightButton.setTitle("\(teamMemberArray[indexPath.row])", for: .normal)
            animateDropMenu(tableView: assignTopRightTableView)
        } else if tableView == assignBottomLeftTableView {
            assignBottomLeftButton.setTitle("\(teamMemberArray[indexPath.row])", for: .normal)
            animateDropMenu(tableView: assignBottomLeftTableView)
        } else if tableView == assignBottomRightTableView {
            assignButtomRightButton.setTitle("\(teamMemberArray[indexPath.row])", for: .normal)
            animateDropMenu(tableView: assignBottomRightTableView)
        } else if tableView == ownerLeftTableView {
            ownerLeftButton.setTitle("\(teamMemberArray[indexPath.row])", for: .normal)
            animateDropMenu(tableView: ownerLeftTableView)
        } else {
            ownerRightButton.setTitle("\(teamMemberArray[indexPath.row])", for: .normal)
            animateDropMenu(tableView: ownerRightTableView)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "UnwindSegue" {
            let detailVC = segue.destination as! TodoListViewController
            detailVC.tableViewData = tableViewData
        }
    }
}
