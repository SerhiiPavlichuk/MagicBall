//
//  SettingViewController.swift
//  MagicBall
//
//  Created by admin on 10.01.2022.
//

import Foundation
import UIKit

class SettingViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userInputTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.userInputTextField.delegate = self

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
