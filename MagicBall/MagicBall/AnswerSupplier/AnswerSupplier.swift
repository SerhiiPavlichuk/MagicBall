//
//  AnswerSupplier.swift
//  MagicBall
//
//  Created by admin on 10.01.2022.
//

import Foundation

struct AnswerSupplier {

    private let onlineAnswerSupplier = OnlineAnswerSupplier()

    func getAnswer(completion: @escaping(Result<Answers, Error>) -> Void) {
        onlineAnswerSupplier.getNetworkAnswer { (result) in
            switch result {
            case .failure: 
print("failure")
            case .success:
                completion(result)
            }
        }
    }
}
