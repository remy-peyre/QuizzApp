//
//  DashboardTableViewController.swift
//  QuizzAPP
//
//  Created by so on 16/12/2018.
//  Copyright © 2018 Remy Peyre. All rights reserved.
//

import UIKit

class DashboardTableViewController: UITableViewController {
    var arrayPlayerScores:Array<String> = []
    
    
    @IBAction func dashboardToMenu(_ sender: Any) {
        self.performSegue(withIdentifier: "DashboardToMenu", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "mode"))

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        if let results = UserDefaults.standard.stringArray(forKey: "scores_player")  {
            self.arrayPlayerScores = results
            if (self.arrayPlayerScores.count == 0) {
                arrayPlayerScores.append("You doesn't play any solo quizz yet")
            }
            print(arrayPlayerScores)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Return the number of rows
        //Adapt the number by the length of UserDefaults.standard.object(forKey: "scores_player"
        return arrayPlayerScores.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseDashboardIdentifier", for: indexPath)
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = UIColor.white
        
        // Configure the cell...
        cell.textLabel?.text = arrayPlayerScores[indexPath.row]
        
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
