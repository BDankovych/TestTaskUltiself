//
//  HabitsFetchService.swift
//  TestTaskUltiself
//
//  Created by Bohdan Dankovych on 25.12.2020.
//

import Foundation

protocol HabitsFetchServiceDelegate: class {
    func dataUpdatedSuccessful(data: [HabitModelDTO], service: HabitsFetchService)
    func dataUpdateFailure(error: Error, service: HabitsFetchService)
}

class HabitsFetchService {
    
    weak var delegate: HabitsFetchServiceDelegate?
    
    init(delegate: HabitsFetchServiceDelegate) {
        self.delegate = delegate
    }
    
    // MARK: Actions
    func fetchData(for query: String) {
        let searchModel = HabitsSearchRequestModelDTO(search: query)
        HabitsAPI.request(.getHabitShortInfo(searchModel: searchModel), codable: HabitsSearchResponseModelDTO.self) { [weak self] model in
            guard let self = self else { return }
            if model.error.isEmpty {
                self.delegate?.dataUpdatedSuccessful(data: model.data, service: self)
            } else {
                let error = UltiselfAPIError.apiError(message: model.error)
                self.delegate?.dataUpdateFailure(error: error, service: self)
            }
        } failure: { [weak self] error in
            guard let self = self else { return }
            self.delegate?.dataUpdateFailure(error: error, service: self)
        }
    }
}
