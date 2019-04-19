//
//  SearchUserTableViewController.swift
//  Checklist
//
//  Created by Ivan Caldwell on 4/18/19.
//  Copyright © 2019 Ivan Caldwell. All rights reserved.
//

import UIKit

struct user {
    var name: String
    var checked: Bool
}

class SearchUserTableViewController: UITableViewController, UISearchBarDelegate {

    var users = ["Iyin Raphael", "Ivan Caldwell", "Yanna Faith", "Daniel Weinman", "Nick Batmanglidj", "Clint Kunz", "Kevin Sooter"]
    var filterUsers = [String]()
    var filtering = false
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        searchBar.delegate = self
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filtering {
            return filterUsers.count
        } else {
            return users.count
        }
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterUsers = users.filter({$0.prefix(searchText.count) == searchText})
        filtering = true
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! SearchUserTableViewCell
        if filtering {
            cell.userNameLabel.text = filterUsers[indexPath.row]
            
        } else {
            cell.userNameLabel.text = users[indexPath.row]
        }
        return cell
    }
    

 


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            users.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let cell = tableView.cellForRow(at: indexPath!) as! SearchUserTableViewCell
        cell.checked = cell.checked ? false : true
        if cell.checked {
            cell.checkButton.setImage(UIImage(named: "checkmark"), for: .normal)
        } else {
            cell.checkButton.setImage(nil, for: .normal)
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
