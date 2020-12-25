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
}
