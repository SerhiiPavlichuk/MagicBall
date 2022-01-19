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
            return UserDefaults.standard.array(forKey: "offlineAnswer") as? [String]
            ?? ["Just do it!", "Change your mind", "Nope", "Yes"]
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "offlineAnswer")
        }
    }
    
//    mutating func saveCustomAnswer(_ customAnswer: [String], completion: @escaping(() -> ())) {
//        self.offlineAnswers = customAnswer
//    }
}
