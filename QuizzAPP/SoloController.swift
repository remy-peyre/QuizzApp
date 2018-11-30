//
//  SoloController.swift
//  QuizzAPP
//
//  Created by Remy Peyre on 26/11/2018.
//  Copyright © 2018 Remy Peyre. All rights reserved.
//

import UIKit
import Alamofire

class SoloController: UIViewController {
    var numberQuestion = 0
    var questions: Array<Any?> = []
    
    @IBOutlet weak var numberQuestionField: UILabel!
    @IBOutlet weak var questionField: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getQuestions()
    }

    func getQuestions() {
        let head = ["Content-Type": "application/x-www-form-urlencoded"]
        Alamofire.request("https://opentdb.com/api.php?amount=10&type=boolean", method: .post, encoding: URLEncoding(), headers: head).responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value as? NSDictionary {
                print("JSON: \(json)") // serialized json response
                print("status")
                let status = json["response_code"] as! Int
                if status == 0 {
                    self.questions = json["results"] as! Array<Any?>
                    let questionsSize =  self.questions.count  as Int
                    while (self.numberQuestion < questionsSize) {
                        print("Question")
                        let question = self.questions[self.numberQuestion] as? NSDictionary
                        self.numberQuestionField.text = "\(self.numberQuestion)"
                        self.questionField.text = question?["question"] as! String
                        print(question?["question"])
                        self.numberQuestion = self.numberQuestion + 1
                    }
                    print("OK")
                }
            }
            
            /*if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }*/
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
