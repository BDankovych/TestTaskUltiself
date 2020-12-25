//
//  HabitsAPIRequests.swift
//  TestTaskUltiself
//
//  Created by Bohdan Dankovych on 25.12.2020.
//

import Foundation

extension HabitsAPI {
    static func getHabitShortInfo(searchModel: HabitsSearchRequestModelDTO,
                                  success: @escaping (HabitsSearchResponseModelDTO) -> Void,
                                  failure: @escaping RequestFailure) {
        
        request(.getHabitShortInfo(searchModel: searchModel),
                codable: HabitsSearchResponseModelDTO.self,
                success: { responseModel in
            success(responseModel)
        }, failure: failure)
    }
}
