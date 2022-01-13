//
//  OnlineAnswerSupplier.swift
//  MagicBall
//
//  Created by admin on 10.01.2022.
//

import Foundation
import Alamofire

struct OnlineAnswerSupplier {

    static let shared = OnlineAnswerSupplier()
    private let endPoint = Constants.Network.endpoint

    func getNetworkAnswer(completion: @escaping (Result<MagicAnswer, Error>) -> Void) {
        AF.request(endPoint).responseJSON { responce in
            let decoder = JSONDecoder()
            if let data = try? decoder.decode(Answers.self, from: responce.data!) {
                completion(Result.success(data.magic!))
            } else if let error = responce.error {
                completion(Result.failure(error))
            }
        }
    }
}
