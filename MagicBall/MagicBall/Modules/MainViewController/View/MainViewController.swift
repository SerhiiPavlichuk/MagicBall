//
//  MainViewController.swift
//  MagicBall
//
//  Created by admin on 10.01.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var answerLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.isHidden = true
    }
}
