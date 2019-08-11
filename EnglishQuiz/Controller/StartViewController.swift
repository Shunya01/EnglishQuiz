//
//  StartViewController.swift
//  EnglishQuiz
//
//  Created by 渡邉舜也 on 11/08/2019.
//  Copyright © 2019 渡邉舜也. All rights reserved.
//

import UIKit
import RevealingSplashView


class StartViewController: UIViewController {

    //Splashを入れる
    override func viewDidLoad() {
        super.viewDidLoad()

        //Splashさせる画像の指定
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "quiz01")!,iconInitialSize: CGSize(width: 70, height: 70), backgroundColor: UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0))
        
        //Adds the revealing splash view as a sub view
        self.view.addSubview(revealingSplashView)
        
        //Splashタイプの指定
        revealingSplashView.animationType = SplashAnimationType.popAndZoomOut
        
        //Starts animation
        revealingSplashView.startAnimation(){
            print("Completed")
        }
    }
    
    //レベル１へ画面遷移させる
    @IBAction func didClickLevel1(_ sender: UIButton) {
        performSegue(withIdentifier: "toLevel1", sender: nil)
    }
    
    //レベル２へ画面遷移させる
    @IBAction func didClickLevel2(_ sender: UIButton) {
        performSegue(withIdentifier: "toLevel2", sender: nil)
    }
    
}
