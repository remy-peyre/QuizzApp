//
//  ResumeMultiTableViewController.swift
//  QuizzAPP
//
//  Created by so on 16/12/2018.
//  Copyright © 2018 Remy Peyre. All rights reserved.
//

import UIKit

class ResumeMultiTableViewController: UITableViewController {
    var arrayPlayers: Array<String> = []
    var arrayGoodAnswers:Array<Any> = []
    var arrayPlayerAnswers:Array<String> = []
    var numberGoodAnswers: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("resume array players",self.arrayPlayers)
        print("resume array good", self.arrayGoodAnswers)
        print("resume array players answers",self.arrayPlayerAnswers)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.arrayGoodAnswers.count + 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseResumeMultiIdentifier", for: indexPath)
        // Configure the cell...
        
        if (indexPath.row < self.arrayGoodAnswers.count) {
            var playerAnswerArray = arrayPlayerAnswers[indexPath.row].split(separator: "-")
            cell.textLabel?.text = arrayGoodAnswers[indexPath.row] as! String +  " - " + playerAnswerArray[1] + " answer:" + playerAnswerArray[2]
            if (self.arrayGoodAnswers[indexPath.row] as! String == playerAnswerArray[2]) {
                cell.textLabel?.textColor = UIColor.green
                numberGoodAnswers = numberGoodAnswers + 1
            } else {
                cell.textLabel?.textColor = UIColor.red
            }
        } else {
            cell.textLabel?.text = "Your score: \(numberGoodAnswers)"
        }
        
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
