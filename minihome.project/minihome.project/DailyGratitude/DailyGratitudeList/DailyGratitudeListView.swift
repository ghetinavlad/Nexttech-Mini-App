//
//  DailyGratitudeListView.swift
//  minihome.project
//
//  Created by vladut on 2/6/23.
//

import Foundation
import SwiftUI

struct DailyGratitudeListView: View {
    
    @StateObject var viewModel = DailyGratitudeListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(viewModel.dailyGratitudeList) { entryItem in
                        entryItemView(entryItem: entryItem)
                    }
                }
                .padding(.vertical, 30)
                .padding(.horizontal, 18)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Daily Gratitude")
                            .font(.title.bold())
                    }
                    
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
                            
                        } label: {
                            Image(systemName: "wake.circle")
                                .foregroundColor(.black)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }
            Spacer()
            }
        }
        .padding(.top, 30)
    }
    
    private func entryItemView(entryItem: JournalTypeEntry) -> some View {
        VStack(alignment: .leading) {
            Text(entryItem.date.dayMonthYearString)
                .foregroundColor(.gray)
                .font(.caption.bold())
            Text(entryItem.summary)
                .foregroundColor(.black)
                .font(.subheadline.bold())
            
            if let photo = entryItem.profilePhoto {
                Image(uiImage: photo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            if let tags = entryItem.tags {
                Text(tags.first!)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            Rectangle()
                .fill(.white)
                .cornerRadius(6)
                .shadow(
                    color: Color.gray.opacity(0.2),
                    radius: 6,
                    x: 0,
                    y: 0
                )
        )
    }
}

struct DailyGratitudeListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
