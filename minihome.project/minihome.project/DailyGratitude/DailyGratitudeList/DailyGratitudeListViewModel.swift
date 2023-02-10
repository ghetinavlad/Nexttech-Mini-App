//
//  DailyGratitudeListViewModel.swift
//  minihome.project
//
//  Created by vladut on 2/6/23.
//

import Foundation
import Combine
import UIKit

class DailyGratitudeListViewModel: ObservableObject {
    
    @Published var dailyGratitudeList: [JournalTypeEntry] = []
    @Published var isLoading = false
    @Published var showDetails = false
    @Published var selectedItem: JournalTypeEntry? = nil
    
    private let repository: DailyGratitudeListRepository
    private var subscribtions = Set<AnyCancellable>()
    
    var getDailyGratitudeListPublisher: AnyPublisher<[JournalTypeEntry], Error> {
        repository.getDailyGratitudeList()
    }
    
    init(repository: DailyGratitudeListRepository = DailyGratitudeListRepositoryImpl()) {
        self.repository = repository
        self.getDailyGratitudeList()
    }
    
    private func getDailyGratitudeList() {
        self.isLoading = true
        self.getDailyGratitudeListPublisher.sink { [weak self] completion in
            guard let self = self else { return }
            self.isLoading = false
            switch completion {
            case .failure(let error):
                self.isLoading = false
                //handle error
            case .finished:
                return
            }
        } receiveValue: { [weak self] response in
            guard let self = self else { return }
            self.isLoading = false
            self.dailyGratitudeList = response.sorted { $0.date < $1.date}
        }.store(in: &subscribtions)
    }
}
