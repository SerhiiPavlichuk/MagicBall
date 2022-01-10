//
//  AnswerSupplier.swift
//  MagicBall
//
//  Created by admin on 10.01.2022.
//

import Foundation

struct AnswerSupplier {

    private let onlineAnswerSupplier = OnlineAnswerSupplier()

    func getAnswer(completion: @escaping(Result<MagicAnswer, Error>) -> Void) {
        onlineAnswerSupplier.getNetworkAnswer { (result) in
            switch result {
            case .failure:

            case .success:
                completion(result)
            }
        }
    }
}
