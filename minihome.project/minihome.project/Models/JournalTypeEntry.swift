//
//  JournalTypeEntry.swift
//  minihome.project
//
//  Created by vladut on 2/6/23.
//

import Foundation
import UIKit

struct JournalTypeEntry: Identifiable {
    let date: Date
    let summary: String
    let profilePhoto: UIImage?
    let tags: [String]
    let photos: [UIImage]?
    
    let id: UUID = UUID()
}
