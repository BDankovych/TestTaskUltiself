//
//  TargetType + BaseConfig.swift
//  TestTaskUltiself
//
//  Created by Bohdan Dankovych on 25.12.2020.
//

import Moya

extension TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://stg.ultiself.com/api") else {
            fatalError("Wrong server Base URL")
        }
        return url
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var defaultHeaders: [String: String]? {
        [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
    }
}
