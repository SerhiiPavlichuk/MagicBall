//
//  OfflineAnswers.swift
//  MagicBall
//
//  Created by admin on 16.01.2022.
//

import Foundation

struct OfflineAnswers {

    static var shared = OfflineAnswers()
    var offlineAnswers: [String] {
        get {
            return UserDefaults.standard.array(forKey: Constants.UserDeafaultsKey.key) as? [String]
            ?? ["Just do it!", "Change your mind", "Nope", "Yes"]
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.UserDeafaultsKey.key)
        }
    }
}
