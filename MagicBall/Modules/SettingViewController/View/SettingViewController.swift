//
//  SettingViewController.swift
//  MagicBall
//
//  Created by admin on 10.01.2022.
//

import Foundation
import UIKit

class SettingViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Enums
    
    private enum ScreenState {
        case blank
        case save
    }

    private enum Action {
        case textChanged
        case buttonPressed
    }

    // MARK: - Outlets

    @IBOutlet weak var userInputTextField: UITextField! {
        didSet {
            userInputTextField.addTarget(self, action: #selector(onTextFieldEdited), for: .editingChanged)
        }
    }

    @IBOutlet weak var saveButton: UIButton!

    // MARK: - Properties

    private let viewModel = SettingViewModel()
    private var screenState: ScreenState = .blank {
        didSet {
            setupUI()
        }
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.userInputTextField.delegate = self
        setupUI()
        print(OfflineAnswers.shared.offlineAnswers)

    }

    // MARK: - Methods

    private func setupUI() {
        func setupBlankState() {
            saveButton.isEnabled = false
            saveButton.alpha = Constants.ButtonAction.disabledButtonAlpha
            saveButton.setTitle(Constants.ButtonAction.buttonSaveName, for: .normal)
            userInputTextField.text?.removeAll()
        }

        func setupEnterTextState() {
            saveButton.isEnabled = true
            saveButton.alpha = Constants.ButtonAction.enabledButtonAlpha
            //            saveButton.setTitle(Constants.ButtonAction.buttonSaveName, for: .normal)
        }

        switch screenState {
        case .blank:
            setupBlankState()
        case .save:
            setupEnterTextState()
        }
    }

    private func alert () {
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

    @objc private func onTextFieldEdited() {
            determineNextState(afterAction: .textChanged)
        }

        private func determineNextState(afterAction action: Action) {
            var resultState: ScreenState?
            func determineNextStateAfterTextChanged() {
                switch screenState {
                case .blank:
                    if userInputTextField.text?.isNotEmpty ?? false {
                        resultState = .save
                    }
                case .save:
                    if userInputTextField.text?.isEmpty ?? true {
                        resultState = .blank
                    }
                }
            }

            func determineNextStateAfterButtonPressed() {
                switch screenState {
                case .blank:
                    break
                case .save:
                    if let value = userInputTextField.text,
                       value.isNotEmpty {
                        viewModel.saveUserTextFieldInput(userInputTextField.text!)
                        alert()
                        resultState = .blank
                    }
                }
            }

            switch action {
            case .textChanged:
                determineNextStateAfterTextChanged()
            case .buttonPressed:
                determineNextStateAfterButtonPressed()
            }

            if let value = resultState {
                screenState = value
            }
        }

    // MARK: - Action
    
    @IBAction func saveAnswerButtonPressed(_ sender: Any) {
//        viewModel.saveUserTextFieldInput(userInputTextField.text!)
//        alert()
        determineNextState(afterAction: .buttonPressed)
    }
}
