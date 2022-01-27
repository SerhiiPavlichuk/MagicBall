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
            return UserDefaults.standard.array(forKey: Constants.UserDeafaults.key) as? [String]
            ?? Constants.UserDeafaults.defaultOfflineAnswers
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.UserDeafaults.key)
        }
    }
}
