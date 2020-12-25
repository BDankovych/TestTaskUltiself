//
//  TargetType + Requests.swift
//  TestTaskUltiself
//
//  Created by Bohdan Dankovych on 25.12.2020.
//

import Moya

extension TargetType {
    static var manager: NetworkManager<Self> {
        NetworkManager<Self>()
    }

    static func request(_ endpoint: Self, success: @escaping RequestSuccess, failure: @escaping RequestFailure) {
        manager.request(endpoint: endpoint, success: { response in
            success(response)
        }) { error in
            failure(error)
        }
    }
    
    static func request<T: Codable>(_ endpoint: Self, codable: T.Type, success: @escaping (T) -> Void, failure: @escaping RequestFailure) {
        manager.request(endpoint: endpoint, success: { response in
            let result = DefaultDecoder.decodeObject(type: T.self, data: response.data)
            switch result {
            case .success(let decodable):
                success(decodable)
            case .failure(let error):
                failure(.apiError(message: error.localizedDescription))
            }
        }) { error in
            failure(error)
        }
    }
}
