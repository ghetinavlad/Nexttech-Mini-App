//
//  DailyGratitudeListViewModel.swift
//  minihome.project
//
//  Created by vladut on 2/6/23.
//

import Foundation
import Combine

class DailyGratitudeListViewModel: ObservableObject {
    
    @Published var dailyGratitudeList: [JournalTypeEntry] = []
    
    init() {
        self.dailyGratitudeList = mockedItems()
    }
    
    private func mockedItems() -> [JournalTypeEntry] {
        var items: [JournalTypeEntry] = []
        items = [JournalTypeEntry(
            date: Date(),
            summary: "Item 1",
            profilePhoto: nil,
            tags: ["gym", "karting", "formula1"],
            photos: nil),
                 JournalTypeEntry(
                    date: Date(),
                    summary: "Item 2",
                    profilePhoto: nil,
                    tags: ["gym", "karting", "formula1"],
                    photos: nil
                 ),
                 JournalTypeEntry(
                    date: Date(),
                    summary: "Item 3",
                    profilePhoto: nil,
                    tags: ["gym", "karting", "formula1"],
                    photos: nil
                 ),
                 JournalTypeEntry(
                    date: Date(),
                    summary: "Item 4",
                    profilePhoto: nil,
                    tags: ["gym", "karting", "formula1"],
                    photos: nil
                 )
        ]
        return items
    }
}
