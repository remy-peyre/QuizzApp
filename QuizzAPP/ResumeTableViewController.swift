//
//  ResumeTableViewController.swift
//  QuizzAPP
//
//  Created by so on 11/12/2018.
//  Copyright © 2018 Remy Peyre. All rights reserved.
//

import UIKit

class ResumeTableViewController: UITableViewController {
    let textField = UITextField()
    var arrayResult:Array<String> = []
    var playerAnswers:Array<String> = []
    var numberGoodAnswers = 0
    
    @IBAction func btnSoloToMenu(_ sender: Any) {
        self.performSegue(withIdentifier: "backmenu", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "mode"))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 11
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.backgroundColor = .clear
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        // Configure the cell...
        if (indexPath.row < 10) {
            cell.textLabel?.text = arrayResult[indexPath.row] +  " - Your answer:" + playerAnswers[indexPath.row]
            if (arrayResult[indexPath.row] == playerAnswers[indexPath.row]) {
                cell.textLabel?.textColor = UIColor.green
                numberGoodAnswers = numberGoodAnswers + 1
            } else {
                cell.textLabel?.textColor = UIColor.red
            }
        } else {
            cell.textLabel?.text = "Your score: \(numberGoodAnswers)"
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let dateString = formatter.string(from: Date())
            let scoreToStore = dateString + " - \(numberGoodAnswers)/10"
            var playerScores = UserDefaults.standard.stringArray(forKey: "scores_player")
            playerScores?.append(scoreToStore)
            UserDefaults.standard.set(playerScores, forKey: "scores_player")
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
