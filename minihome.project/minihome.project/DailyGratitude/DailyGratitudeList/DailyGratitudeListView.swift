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
            ScrollView(showsIndicators: false) {
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    if let selectedItem = viewModel.selectedItem {
                        NavigationLink(
                            isActive: .constant(true),
                            destination: { DailyGratitudeDetailsView(viewModel: DailyGratitudeDetailsViewModel(item: selectedItem)) },
                            label: { EmptyView() }
                        )
                    }
                    VStack(spacing: 12) {
                        ForEach(viewModel.dailyGratitudeList) { entryItem in
                            entryItemView(entryItem: entryItem)
                                .onTapGesture {
                                    viewModel.selectedItem = entryItem
                                }
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
            .onAppear {
                viewModel.selectedItem = nil
            }
        }
        .accentColor(.black)
        .padding(.top, 30)
    }
    
    private func entryItemView(entryItem: JournalTypeEntry) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(entryItem.date.dayMonthYearString)
                .foregroundColor(.gray)
                .font(.caption.bold())
            Text(entryItem.summary)
                .foregroundColor(.black)
                .font(.subheadline.bold())
                .fixedSize(horizontal: false, vertical: true)
            
            if let photoData = entryItem.profilePhoto, let photoImage = photoData.image {
                Image(uiImage: photoImage)
                    .resizable()
                    .frame(height: 140)
                    .cornerRadius(6)
                    .aspectRatio(contentMode: .fit)
            }
            
            if let tags = entryItem.tags {
                TagsView(items: tags)
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

struct TagsView: View {
    
    let items: [String]
    var groupedItems: [[String]] = [[String]]()
    let screenWidth = UIScreen.main.bounds.width
    
    init(items: [String]) {
        self.items = items
        self.groupedItems = createGroupedItems(items)
    }
    
    private func createGroupedItems(_ items: [String]) -> [[String]] {
        
        var groupedItems: [[String]] = [[String]]()
        var tempItems: [String] =  [String]()
        var width: CGFloat = 0
        
        for word in items {
            
            let label = UILabel()
            label.text = word
            label.sizeToFit()
            
            let labelWidth = label.frame.size.width + 18
            
            if (width + labelWidth + 18) < screenWidth {
                width += labelWidth
                tempItems.append(word)
            } else {
                width = labelWidth
                groupedItems.append(tempItems)
                tempItems.removeAll()
                tempItems.append(word)
            }
            
        }
        
        groupedItems.append(tempItems)
        return groupedItems
        
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(groupedItems, id: \.self) { subItems in
                HStack {
                    ForEach(subItems, id: \.self) { word in
                        Text(word)
                            .fixedSize()
                            .font(.caption)
                            .padding(.all , 4)
                            .foregroundColor(.gray)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(.gray, lineWidth: 1)
                            )
                    }
                }
            }
        }
    }
    
}

struct DailyGratitudeListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
