//
//  OfflineAnswerSupplier.swift
//  MagicBall
//
//  Created by admin on 10.01.2022.
//

import Foundation

struct OfflineAnswerSupplier {

    static let shared = OfflineAnswerSupplier()
    
    func getOfflineAnswer(completion: @escaping (String) -> Void) {
        if let answer = OfflineAnswers.shared.offlineAnswers.randomElement() {
            completion(answer)
        } else {
            print("FAILURE")
        }
    }
}
