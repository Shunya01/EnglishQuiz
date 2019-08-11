//
//  ViewController.swift
//  EnglishQuiz
//
//  Created by 渡邉舜也 on 11/08/2019.
//  Copyright © 2019 渡邉舜也. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var problem: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    //正解は何番かを指定するための変数
    var correctAnswer = String()
    
    //総問題数を数えるための変数
    var problemCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RandomQuestions()
    }
    
    func RandomQuestions(){
        var randomNumber = arc4random_uniform(3)
        randomNumber += 1
        
        switch randomNumber {
        case 1:
            problem.text = "apple"
            option1.setImage(UIImage(named:"apple01")!, for: .normal)
            option2.setImage(UIImage(named:"banana01")!, for: .normal)
            option3.setImage(UIImage(named:"melon01")!, for: .normal)
            correctAnswer = "1"
            
        case 2:
            problem.text = "tiger"
            option1.setImage(UIImage(named:"elephant01")!, for: .normal)
            option2.setImage(UIImage(named:"tiger01")!, for: .normal)
            option3.setImage(UIImage(named:"zebra01")!, for: .normal)
            correctAnswer = "2"
            
        case 3:
            problem.text = "run"
            option1.setImage(UIImage(named:"swim01")!, for: .normal)
            option2.setImage(UIImage(named:"sleep01")!, for: .normal)
            option3.setImage(UIImage(named:"run01")!, for: .normal)
            correctAnswer = "3"
            
        default:
            print("エラーです")
        }
    }
    
    //正解した際のアラートの作成
    fileprivate func MakeCorrectAlert() {
        //アラートの画面を作成する
        let alert = UIAlertController(title: "Correct！", message: "Good Job👍", preferredStyle: .alert)
        
        //通常の選択肢を作成する
        let yesAction = UIAlertAction(title: "Close", style: .default) { (UIAlertAction) in
            print("Closeが押されました")
        }
        
        //作成した通常の選択肢をアラート画面に追加する
        alert.addAction(yesAction)
        
        //作成した画面を実際に表示する
        present(alert, animated: true, completion: nil)
    }
    
    //間違えた際のアラートの作成
    fileprivate func MakeWrongAlert() {
        //アラートの画面を作成する
        let alert = UIAlertController(title: "Wrong！", message: "Try Again!", preferredStyle: .alert)
        
        //通常の選択肢を作成する
        let yesAction = UIAlertAction(title: "Close", style: .default) { (UIAlertAction) in
            print("Closeが押されました")
        }
        
        //作成した通常の選択肢をアラート画面に追加する
        alert.addAction(yesAction)
        
        //作成した画面を実際に表示する
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func DidClick1(_ sender: UIButton) {
        if correctAnswer == "1"{
          resultLabel.text = "Correct"
          problemCount += 1
          MakeCorrectAlert()
        }else{
          resultLabel.text = "Wrong"
          MakeWrongAlert()
        }
    }
    
    @IBAction func DidClick2(_ sender: UIButton) {
        if correctAnswer == "2"{
            resultLabel.text = "Correct"
            problemCount += 1
            MakeCorrectAlert()
        }else{
            resultLabel.text = "Wrong"
            MakeWrongAlert()
        }
    }
    
    @IBAction func DidClick3(_ sender: UIButton) {
        if correctAnswer == "3"{
            resultLabel.text = "Correct"
            problemCount += 1
            MakeCorrectAlert()
        }else{
            resultLabel.text = "Wrong"
            MakeWrongAlert()
        }
    }
    
    @IBAction func DidClickAnswer(_ sender: UIButton) {
        
        //アラートの画面を作成する
        let alert = UIAlertController(title: "Answer", message: "1)Apple2)Banana3)Melon", preferredStyle: .alert)
        
        //通常の選択肢を作成する
        let yesAction = UIAlertAction(title: "Close", style: .default) { (UIAlertAction) in
            print("閉じるが押されました")
        }
        
        //作成した通常の選択肢をアラート画面に追加する
        alert.addAction(yesAction)
        //作成した画面を実際に表示する
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func DidClickNext(_ sender: UIButton) {
        if problemCount >= 3 {
            performSegue(withIdentifier: "toResult", sender: nil)
        }else{
            RandomQuestions()
            resultLabel.text = "Correct or Wrong?"
        }
    }
    
    
    
}

