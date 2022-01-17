//
//  MagicBallViewModel.swift
//  MagicBall
//
//  Created by admin on 13.01.2022.
//

import Foundation

class MagicBallViewModel {

    func getOnlineAnswer(completion: @escaping (String) -> Void) {
        OnlineAnswerSupplier.shared.getNetworkAnswer { (result) in
            if let answer = result.answer {
                completion(answer)
            }
        }
    }
    func getOfflineAnswer(completion: @escaping (String) -> Void) {
        OfflineAnswerSupplier.shared.getOfflineAnswer { (offLineResult) in
            completion(offLineResult)
        }
    }
}
