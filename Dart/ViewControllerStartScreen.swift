//
//  ViewControllerStartScreen.swift
//  Dart
//
//  Created by Tejay Beckedorf on 18.07.19.
//  Copyright © 2019 Tejay Beckedorf. All rights reserved.
//

import UIKit

class ViewControllerStartScreen: UIViewController {
    var nc: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func start301Game(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        nc = UINavigationController(rootViewController: secondVC)
        secondVC.startingPoints = 301
        self.present(nc!, animated: true, completion: nil)
    }
    
    @IBAction func start501Game(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        nc = UINavigationController(rootViewController: secondVC)
        secondVC.startingPoints = 501
        self.present(nc!, animated: true, completion: nil)
    }

}
