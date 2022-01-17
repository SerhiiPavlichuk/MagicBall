//
//  MagicBallViewController.swift
//  MagicBall
//
//  Created by admin on 10.01.2022.
//

import UIKit

class MagicBallViewController: UIViewController {

    static let shared = MagicBallViewController()
    private let viewModel = MagicBallViewModel()

    @IBOutlet weak var answerLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        answerLabel.isHidden = true

    }

    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }

        if OnlineAnswerSupplier.shared.checkConnection() {
            getOnlineAnswer()
        } else {
            getOffLineAnswer()
        }
    }

     func updateAnswerLabel(with answer: String) {
        DispatchQueue.main.async {
            self.answerLabel?.text = answer
        }
    }

    private func getOnlineAnswer() {
        self.viewModel.getOnlineAnswer(completion: { answer in
            self.answerLabel.isHidden = false
            self.updateAnswerLabel(with: answer)
        })
    }

    private func getOffLineAnswer() {
        self.viewModel.getOfflineAnswer(completion: { offLineResult in
            self.answerLabel.isHidden = false
            self.updateAnswerLabel(with: offLineResult)
        })
    }
}
