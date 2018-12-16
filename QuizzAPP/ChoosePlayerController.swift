//
//  ChoosePlayerController.swift
//  QuizzAPP
//
//  Created by so on 16/12/2018.
//  Copyright © 2018 Remy Peyre. All rights reserved.
//

import UIKit

class ChoosePlayerController: UIViewController {
    var countPlayers = 0
    var arrayPlayers:Array<String> = []

    @IBOutlet weak var playerNameField: UITextField!
    
    @IBOutlet weak var typePlayerLabel: UILabel!
    
    @IBAction func validPlayerButton(_ sender: UIButton) {
        if (playerNameField.text! != "") {
            arrayPlayers.append(playerNameField.text!)
            self.countPlayers = self.countPlayers + 1
            typePlayerLabel.text = "Type your name (player \(self.countPlayers))"
            playerNameField.text = ""
        }
    }
    
    @IBAction func playTheGameButton(_ sender: UIButton) {
        if (self.arrayPlayers.count >= 2) {
            self.performSegue(withIdentifier: "linkToMultiGame", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let multiViewController = segue.destination as? MultiController {
            multiViewController.arrayPlayers = self.arrayPlayers
        }
    }
    

}
