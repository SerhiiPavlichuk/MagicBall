//
//  AnswerSupplier.swift
//  MagicBall
//
//  Created by admin on 10.01.2022.
//

import Foundation

struct AnswerSupplier {

//    static let shared = AnswerSupplier()

    func getAnswer(completion: @escaping(Result<MagicAnswer, Error>) -> Void) {
        OnlineAnswerSupplier.shared.getNetworkAnswer { (result) in
            switch result {
            case .failure: 
                print("failure")
            case .success:
                completion(result)
            }
        }
    }
}
