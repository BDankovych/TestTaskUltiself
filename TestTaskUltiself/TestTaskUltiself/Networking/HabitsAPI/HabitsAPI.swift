//
//  HabitsAPI.swift
//  TestTaskUltiself
//
//  Created by Bohdan Dankovych on 25.12.2020.
//

import Moya

enum HabitsAPI: TargetType, AccessTokenAuthorizable {
    case getHabitShortInfo(searchModel: HabitsSearchRequestModelDTO)
}

extension HabitsAPI {
    
    var authorizationType: AuthorizationType? {
        .bearer
    }
    
    var path: String {
        switch self {
        case .getHabitShortInfo:
            return "/commands/get-habit-short-info-list"
        }
    }
    
    var method: Method {
        switch self {
        case .getHabitShortInfo:
            return .post
        }
    }
    
    var sampleData: Data {
        let result: Data?
        switch self {
        case .getHabitShortInfo:
            let model = HabitsSearchResponseModelDTO(data: [
                HabitDataDTO(id: 1, title: "test 1"),
                HabitDataDTO(id: 2, title: "test 2")
            ],
            error: ""
            )
            result = try? JSONEncoder().encode(model)
        }
        return result ?? Data()
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .getHabitShortInfo:
            return JSONEncoding.default
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .getHabitShortInfo(let model):
            return filterNilParameters(model.asDictionary() ?? [:])
        }
    }
    
    var task: Task {
        switch self {
        case .getHabitShortInfo:
            return .requestParameters(parameters: parameters, encoding: parameterEncoding)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .getHabitShortInfo:
            return defaultHeaders
        }
    }
}
