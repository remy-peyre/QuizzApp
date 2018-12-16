//
//  GameController.swift
//  QuizzAPP
//
//  Created by Remy Peyre on 26/11/2018.
//  Copyright © 2018 Remy Peyre. All rights reserved.
//

import UIKit

class GameController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonDashboard(_ sender: UIButton) {
        self.performSegue(withIdentifier: "linkToDashboard", sender: nil)
    }
    
    @IBOutlet weak var buttonSolo: UIButton!
    @IBAction func buttonSolo(_ sender: Any) {
        print("Solo")
        self.performSegue(withIdentifier: "linkToSolo", sender: nil)
    }
    
    @IBOutlet weak var buttonMulti: UIButton!
    @IBAction func buttonMulti(_ sender: UIButton) {
        print("Multi")
        self.performSegue(withIdentifier: "linkToMulti", sender: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
