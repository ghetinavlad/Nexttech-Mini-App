//
//  Networking.swift
//  minihome.project
//
//  Created by vladut on 2/9/23.
//

import Foundation
import Combine
import UIKit

protocol APIClient: AnyObject {
    func performRequest<T: Decodable>() -> AnyPublisher<T, Error>
}

extension APIClient {
    func performRequest<T: Decodable>() -> AnyPublisher<T, Error> {
        return Future { promise in
            let data = mockedItems()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                promise(.success(data as! T))
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}

private func mockedItems() -> [JournalTypeEntry] {
    var items: [JournalTypeEntry] = []
    items = [JournalTypeEntry(
        date: Date(),
        summary: "Item 1",
        profilePhoto: UIImage(named: "image-1")!.data,
        tags: ["#travelling", "#roadtrip"],
        photos: nil),
             JournalTypeEntry(
                date: Date(),
                summary: "Item 2",
                profilePhoto: UIImage(named: "image-2")!.data,
                tags: ["#nature", "#trees", "#landscape", "#greece", "#mountain"],
                photos: [UIImage(named: "image-1")!.data!, UIImage(named: "image-2")!.data!, UIImage(named: "image-1")!.data!,
                         UIImage(named: "image-1")!.data!, UIImage(named: "image-2")!.data!, UIImage(named: "image-1")!.data!]
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


