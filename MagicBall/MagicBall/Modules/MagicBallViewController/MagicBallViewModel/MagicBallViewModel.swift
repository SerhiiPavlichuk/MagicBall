//
//  MagicBallViewModel.swift
//  MagicBall
//
//  Created by admin on 13.01.2022.
//

import Foundation

class MagicBallViewModel {

    private let answerSupplier = AnswerSupplier()

    func getAnswer(completion: @escaping (() -> ())) {
        answerSupplier.getAnswer { (result) in
            switch result {
            case .success(let answer):
                MagicBallViewController.shared.updateAnswerLabel(with: answer.answer!)
            case .failure:
                MagicBallViewController.shared.updateAnswerLabel(with: "")
            }
        }
    }
}
