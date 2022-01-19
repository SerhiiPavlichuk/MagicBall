//
//  SettingViewController.swift
//  MagicBall
//
//  Created by admin on 10.01.2022.
//

import Foundation
import UIKit

class SettingViewController: UIViewController, UITextFieldDelegate {

    let viewModel = SettingViewModel()

    @IBOutlet weak var userInputTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.userInputTextField.delegate = self
    }
    
    @IBAction func saveAnswerButtonPressed(_ sender: Any) {
        viewModel.saveUserTextFieldInput(userInputTextField.text!)

        let alert = UIAlertController(title: Constants.UI.textSavedMessage,
                                      message: nil,
                                      preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: Constants.UI.okMessage,
                                      style: UIAlertAction.Style.default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
