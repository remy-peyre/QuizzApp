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
    
    var seconds = 10 //This variable will hold a starting value of seconds. It could
    var timer = Timer()
    var arrayGoodAnswers:Array<Any> = []
    var arrayPlayerAnswers:Array<String> = []
    
    @IBOutlet weak var counterField: UILabel!
    @IBOutlet weak var numberQuestionField: UILabel!
    @IBOutlet weak var questionField: UILabel!
    
    @IBAction func buttonTrue(_ sender: Any) {
        answer(value: true)
    }
    
    @IBAction func buttonFalse(_ sender: Any) {
        answer(value: false)
    }
    
    func convertBoolToString(value: Bool) -> String {
        if value {
            return "True"
        } else {
            return "False"
        }
    }
    
    func answer(value : Bool) {
        let question = self.questions[self.numberQuestion] as? NSDictionary
        if let answer = question?["correct_answer"]{
            arrayGoodAnswers.append(answer)
            arrayPlayerAnswers.append(convertBoolToString(value: value))
        }
        numberQuestion = numberQuestion + 1
        seconds = 11
    }
    
    @objc func handleEverySecond() {
        seconds = seconds - 1
        if (self.numberQuestion > 9) {
            timer.invalidate()
            UserDefaults.standard.set(arrayGoodAnswers, forKey:"results")
            UserDefaults.standard.set(arrayPlayerAnswers, forKey:"PlayerAnswers")
            self.performSegue(withIdentifier: "resume", sender: nil)
            return
        }
        let question = self.questions[self.numberQuestion] as? NSDictionary
        
        self.numberQuestionField.text = "\(self.numberQuestion + 1)"
        let questionText = question?["question"] as? String
        let questionTextDecoded = questionText?.htmlDecoded
 
        self.questionField.text = questionTextDecoded
        if (self.seconds == 0) {
            self.numberQuestion = self.numberQuestion + 1
            self.seconds = 11
        }
        self.counterField.text = "\(self.seconds)s"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.runTimer()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(handleEverySecond), userInfo: nil, repeats: true)
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

extension String {
    var htmlDecoded: String {
        let decoded = try? NSAttributedString(data: Data(utf8), options: [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
            ], documentAttributes: nil).string
        
        return decoded ?? self
    }
}
