//
//  TodoListViewController.swift
//  TeamHome
//
//  Created by Ivan Caldwell on 3/28/19.
//  Copyright © 2019 Lambda School under the MIT license. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource {
    let sortByArray: [String] = ["Date Ascending", "Date Descending", "Creator", "Asignee"]
    let filterByArray: [String] = ["Active", "Complete", "Created by Me", "Assigned to Me", "All"]
    
    // OUTLETS AND ACTIONS
    @IBOutlet weak var sortByButton: UIButton!
    @IBOutlet weak var filterByButton: UIButton!
    @IBOutlet weak var filterByTableView: UITableView!
    @IBOutlet weak var sortByTableView: UITableView!
    
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
        filterByTableView.isHidden = true
        sortByTableView.isHidden = true
    }
    
    //    func animate(toggle: Bool, tableView: UITableView) {
    //        if toggle {
    //            UIView.animate(withDuration: 0.3) {
    //                tableView.isHidden = false
    //            }
    //        } else {
    //            UIView.animate(withDuration: 0.3) {
    //                tableView.isHidden = true
    //            }
    //        }
    //    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == filterByTableView {
            return filterByArray.count
        } else {
            return sortByArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Hello table View")
        if tableView == sortByTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SortByCell", for: indexPath)
            cell.textLabel?.text = sortByArray[indexPath.row]
            //print(cell.textLabel?.text)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FilterStatusCell", for: indexPath)
            cell.textLabel?.text = filterByArray[indexPath.row]
            //print(cell.textLabel?.text)
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == sortByTableView {
            sortByButton.setTitle("\(sortByArray[indexPath.row])", for: .normal)
            animateDropMenu(tableView: sortByTableView)
        } else {
            filterByButton.setTitle("\(filterByArray[indexPath.row])", for: .normal)
            animateDropMenu(tableView: filterByTableView)
        }
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
