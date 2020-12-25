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
    
    private struct CurrentSearchModel {
        var query: String
        var page: Int
        static var pageSize = 30
        
        var loadedItems: Int {
            page * CurrentSearchModel.pageSize
        }
    }
    
    weak var delegate: HabitsFetchServiceDelegate?
    
    private var currentSearchModel: CurrentSearchModel!
    private var data = [HabitModelDTO]()
    
    private let semaphore = DispatchSemaphore(value: 1)
    
    init(delegate: HabitsFetchServiceDelegate) {
        self.delegate = delegate
    }
    
    private func updateSearchModel(query: String) {
        data = []
        currentSearchModel = CurrentSearchModel(query: query, page: 1)
    }
    
    // MARK: Actions
    func fetchData(for query: String) {
        semaphore.wait()
        updateSearchModel(query: query)
        createNetworkRequest()
    }
    
    func fetchNextPageIfNeeded(displayedIndex: Int) {
        semaphore.wait()
        if displayedIndex == currentSearchModel.loadedItems - 5 {
            currentSearchModel.page += 1
            createNetworkRequest()
            semaphore.signal()
        } else {
            semaphore.signal()
        }
        
    }
    
    private func createNetworkRequest() {
        let searchModel = HabitsSearchRequestModelDTO(search: currentSearchModel.query,
                                                      page: currentSearchModel.page,
                                                      pageSize: CurrentSearchModel.pageSize
        )
        
        HabitsAPI.request(.getHabitShortInfo(searchModel: searchModel), codable: HabitsSearchResponseModelDTO.self) { [weak self] model in
            guard let self = self else { return }
            self.semaphore.signal()
            if model.error.isEmpty {
                self.data.append(contentsOf: model.data)
                self.delegate?.dataUpdatedSuccessful(data: self.data, service: self)
            } else {
                let error = UltiselfAPIError.apiError(message: model.error)
                self.delegate?.dataUpdateFailure(error: error, service: self)
            }
        } failure: { [weak self] error in
            guard let self = self else { return }
            self.semaphore.signal()
            self.delegate?.dataUpdateFailure(error: error, service: self)
        }
    }
}
