//
//  MagicBallViewModel.swift
//  MagicBall
//
//  Created by admin on 13.01.2022.
//

import Foundation

class MagicBallViewModel {

    func getAnswer(completion: @escaping (String) -> Void) {
        AnswerSupplier.shared.getAnswer { (result) in
            switch result {
            case .success(let answer):
                completion(answer.answer!)
            case .failure:
                MagicBallViewController.shared.updateAnswerLabel(with: "")
            }
        }
    }
}
