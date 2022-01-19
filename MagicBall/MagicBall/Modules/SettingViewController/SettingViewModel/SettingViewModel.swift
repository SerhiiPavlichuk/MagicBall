//
//  SettingViewModel.swift
//  MagicBall
//
//  Created by admin on 17.01.2022.
//

import Foundation

class SettingViewModel {

//    func saveUserTextFieldInput(_ customAnswer: String?, completion: @escaping(() -> ())) {
//
//        guard let customAnswer = customAnswer else { return }
//        OfflineAnswers.saveCustomAnswer(customAnswer)
//    }

    func saveUserTextFieldInput(_ customAnswer: String, completion: @escaping(() -> ())) {

        OfflineAnswers.shared.saveCustomAnswer { (customAnswer) in
            completion(customAnswer)
        }
    }
}
