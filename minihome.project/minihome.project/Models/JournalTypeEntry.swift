//
//  JournalTypeEntry.swift
//  minihome.project
//
//  Created by vladut on 2/6/23.
//

import Foundation
import UIKit

struct JournalTypeEntry: Identifiable, Decodable {
    let date: Date
    let summary: String
    let profilePhoto: Data?
    let tags: [String]
    let photos: [Data]?
    
    var id: UUID = UUID()
}
