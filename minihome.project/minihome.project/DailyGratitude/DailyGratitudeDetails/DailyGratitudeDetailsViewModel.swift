//
//  DailyGratitudeDetailsViewModel.swift
//  minihome.project
//
//  Created by vladut on 2/7/23.
//

import Foundation

import Foundation
import Combine
import UIKit

class DailyGratitudeDetailsViewModel: ObservableObject {
    
    @Published var item: JournalTypeEntry
    
    init(item: JournalTypeEntry) {
        self.item = item
    }
}
