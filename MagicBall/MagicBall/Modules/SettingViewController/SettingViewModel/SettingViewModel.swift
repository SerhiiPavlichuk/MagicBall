//
//  SettingViewModel.swift
//  MagicBall
//
//  Created by admin on 17.01.2022.
//

import Foundation

class SettingViewModel {

    func saveUserTextFieldInput(_ customAnswer: String) {
        OfflineAnswers.shared.offlineAnswers.append(customAnswer)
    }
}
