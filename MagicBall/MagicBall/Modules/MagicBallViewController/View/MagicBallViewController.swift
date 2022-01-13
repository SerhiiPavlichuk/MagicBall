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
        self.answerLabel.isHidden = false
        self.viewModel.getAnswer {
        }
    }

    func updateAnswerLabel(with answer: String) {
        self.answerLabel?.text = answer
    }
}
