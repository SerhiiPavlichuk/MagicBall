//
//  MagicBallViewController.swift
//  MagicBall
//
//  Created by admin on 10.01.2022.
//

import UIKit

class MagicBallViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var answerLabel: UILabel!

    // MARK: - Properties

    static let shared = MagicBallViewController()
    private let viewModel = MagicBallViewModel()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        answerLabel.isHidden = true
    }

    // MARK: - Methods

    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }

        if OnlineAnswerSupplier.shared.checkConnection() {
            getOnlineAnswer()
        } else {
            getOffLineAnswer()
        }
    }

    private func updateAnswerLabel(with answer: String) {
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
