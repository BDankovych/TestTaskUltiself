//
//  HabitsSearchResponseDTO.swift
//  TestTaskUltiself
//
//  Created by Bohdan Dankovych on 25.12.2020.
//

import Foundation

class HabitsSearchResponseModelDTO: Codable {
    private(set) var data: [HabitDataDTO]
    private(set) var error: String
    
    init(data: [HabitDataDTO], error: String) {
        self.data = data
        self.error = error
    }
}
