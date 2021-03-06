//
//  Constants.swift
//  MagicBall
//
//  Created by admin on 10.01.2022.
//

import Foundation
import UIKit

struct Constants {

    struct Network {
        static let endpoint = "https://8ball.delegator.com/magic/JSON/letsrock?"
    }

    struct UI {
        static let textSavedMessage = "Answer saved!"
        static let okMessage = "Ok 😊"
    }

    struct ButtonAction {
        static let disabledButtonAlpha: CGFloat = 0.6
        static let enabledButtonAlpha: CGFloat =  1
        static let buttonSaveName = "Save Answer"
    }

    struct UserDeafaults {
        static let key = "offlineAnswers"
        static let defaultOfflineAnswers = ["Just do it!", "Change your mind", "Nope", "Yes"]
    }
}
