//
//  HomeController.swift
//  QuizzAPP
//
//  Created by Remy Peyre on 26/11/2018.
//  Copyright © 2018 Remy Peyre. All rights reserved.
//

import UIKit
import Alamofire

class HomeController: UIViewController {

    @IBOutlet weak var buttonHome: UIButton!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func buttonHome(_ sender: UIButton) {
        print(emailField.text ?? "")
        print(passwordField.text ?? "")
        
        /*self.performSegue(withIdentifier: "linkToHome", sender: nil)*/
        login(email: emailField.text ?? "", password: passwordField.text ?? "")

    }
    
    func login(email: String, password: String) {
        let head = ["Content-Type": "application/x-www-form-urlencoded"]
        let param = ["email": email,"password": password]
        
        Alamofire.request("http://edu2.shareyourtime.fr/api/auth", method: .post, parameters: param, encoding: URLEncoding(), headers: head).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


