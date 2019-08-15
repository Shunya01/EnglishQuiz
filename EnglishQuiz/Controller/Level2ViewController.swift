//
//  Level2ViewController.swift
//  EnglishQuiz
//
//  Created by 渡邉舜也 on 11/08/2019.
//  Copyright © 2019 渡邉舜也. All rights reserved.
//

import UIKit

class Level2ViewController: UIViewController {
    
    
    @IBOutlet weak var problem: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    //正解は何番かを指定するための変数
    var correctAnswer = String()
    
    //総問題数を数えるための変数
    var problemCount = 0
    
    //アラートの中身を設定するための変数
    var answers = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //アプリ起動時にRandomQuestions()でクイズを作成
        RandomQuestions()
    }
    
    //クイズを作成するための関数
    func RandomQuestions(){
        //ランダムに０〜２の数字を作成
        var randomNumber = arc4random_uniform(3)
        //その数字に１を足して１〜３の数ができるようにする
        randomNumber += 1
        
        //randomNumberの数字を元にswitch文で場合分け
        switch randomNumber {
        case 1:
            problem.text = "Mars"
            option1.setImage(UIImage(named:"saturn01")!, for: .normal)
            option2.setImage(UIImage(named:"sun01")!, for: .normal)
            option3.setImage(UIImage(named:"Mars01")!, for: .normal)
            answers = "1)Saturn 2)Sun 3)Mars"
            correctAnswer = "3"
            
        case 2:
            problem.text = "kidney"
            option1.setImage(UIImage(named:"intestine01")!, for: .normal)
            option2.setImage(UIImage(named:"kidney01")!, for: .normal)
            option3.setImage(UIImage(named:"pancreas01")!, for: .normal)
            answers = "1)intestine 2)kidney 3)pancreas"
            correctAnswer = "2"
            
        case 3:
            problem.text = "platypus"
            option1.setImage(UIImage(named:"donkey01")!, for: .normal)
            option2.setImage(UIImage(named:"sloth01")!, for: .normal)
            option3.setImage(UIImage(named:"platypus01")!, for: .normal)
            answers = "1)donkey 2)sloth 3)platypus"
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
    
    //"Answer"ボタンを押された時
    @IBAction func DidClickAnswer(_ sender: UIButton) {
        
        //アラートの画面を作成する
        let alert = UIAlertController(title: "Answer", message:answers, preferredStyle: .alert)
        
        //通常の選択肢を作成する
        let yesAction = UIAlertAction(title: "Close", style: .default) { (UIAlertAction) in
            print("閉じるが押されました")
        }
        
        //作成した通常の選択肢をアラート画面に追加する
        alert.addAction(yesAction)
        //作成した画面を実際に表示する
        present(alert, animated: true, completion: nil)
        
    }
    
    //"Next Answer"ボタンが押された時
    @IBAction func DidClickNext(_ sender: UIButton) {
        if problemCount >= 3 {
            performSegue(withIdentifier: "toResult", sender: nil)
        }else{
            RandomQuestions()
            resultLabel.text = "Correct or Wrong?"
        }
    }
    
    
    
}
