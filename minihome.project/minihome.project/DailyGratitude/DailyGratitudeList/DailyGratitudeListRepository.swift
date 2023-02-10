//
//  DailyGratitudeListRepository.swift
//  minihome.project
//
//  Created by vladut on 2/9/23.
//

import Foundation
import Combine

protocol DailyGratitudeListRepository: APIClient {
    func getDailyGratitudeList() -> AnyPublisher<[JournalTypeEntry], Error>
}

final class DailyGratitudeListRepositoryImpl: DailyGratitudeListRepository {
    func getDailyGratitudeList() -> AnyPublisher<[JournalTypeEntry], Error> {
        let dtoPublisher: AnyPublisher<[JournalTypeEntry], Error> = self.performRequest()
        return dtoPublisher.receive(on: DispatchQueue.main).eraseToAnyPublisher()
    }
}
