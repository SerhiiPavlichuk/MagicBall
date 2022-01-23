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

    func checkConnection() -> Bool {
        let connectionStatus = NetworkReachabilityManager(host: endPoint)?.isReachable
        return connectionStatus!
    }

    func getNetworkAnswer(completion: @escaping (MagicAnswer) -> ()) {
        AF.request(endPoint).responseJSON { responce in
            let decoder = JSONDecoder()
            if let data = try? decoder.decode(Answers.self, from: responce.data!) {
                completion(data.magic!)
            }
        }
    }
}
