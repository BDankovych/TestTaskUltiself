//
//  HabitsSearchRequestDTO.swift
//  TestTaskUltiself
//
//  Created by Bohdan Dankovych on 25.12.2020.
//

import Foundation

class HabitsSearchRequestModelDTO: Codable {
    private(set) var search: String
    private(set) var page: Int
    private(set) var pageSize: Int
    
    enum CodingKeys: String, CodingKey {
        case search
        case page
        case pageSize = "page-size"
    }
    
    init(search: String, page: Int = 1, pageSize: Int = 10) {
        self.search = search
        self.page = page
        self.pageSize = pageSize
    }
}
