//
//  MainViewController.swift
//  MagicBall
//
//  Created by admin on 10.01.2022.
//

import UIKit

class MainViewController: UIViewController {
    
let test = OnlineAnswerSupplier()

    @IBOutlet weak var answerLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.isHidden = true
        
        test.getNetworkAnswer { (result) in
            print(result)
        }
    }
}
