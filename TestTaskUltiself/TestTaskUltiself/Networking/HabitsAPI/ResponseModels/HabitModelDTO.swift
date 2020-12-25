//
//  HabitModelDTO.swift
//  TestTaskUltiself
//
//  Created by Bohdan Dankovych on 25.12.2020.
//

import Foundation

class HabitDataDTO: Codable {
    private(set) var id: Int
    private(set) var title: String
    
    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}
