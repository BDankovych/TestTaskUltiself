//
//  NetworkManager.swift
//  TestTaskUltiself
//
//  Created by Bohdan Dankovych on 25.12.2020.
//

import Moya

typealias RequestSuccess = (Response) -> Void
typealias RequestFailure = (UltiselfAPIError) -> Void

class NetworkManager<T> where T: TargetType {
    
    private func createSession() -> Session {
        Session()
    }
    
    private func createProvider() -> MoyaProvider<T> {
        let authPlugin = AccessTokenPlugin { _ in
            "Xu8eygANeRVH7SexM1TLazI7nvZnqVgjCwuI02lEIZi9dWxZ0TVC3irlhK3h"
        }
        return MoyaProvider<T>(session: session, plugins: [authPlugin])
    }
    
    private var session: Session!
    private var provider: MoyaProvider<T>!
    
    init() {
        session = createSession()
        provider = createProvider()
    }
    
    func request(endpoint: T, success: @escaping RequestSuccess, failure: @escaping RequestFailure) {
        URLCache.shared.removeAllCachedResponses()
        provider.request(endpoint) { result in
            switch result {
            case let .success(response):
                success(response)
            case let .failure(error):
                failure(.networkError(error))
            }
        }
    }
}
