//
//  DailyGratitudeDetailsView.swift
//  minihome.project
//
//  Created by vladut on 2/7/23.
//

import Foundation
import SwiftUI

struct DailyGratitudeDetailsView: View {
    
    @StateObject var viewModel: DailyGratitudeDetailsViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(viewModel.item.date.dayMonthYearString)
                .foregroundColor(.gray)
                .font(.body.bold())
            
            Text(viewModel.item.summary)
                .foregroundColor(.black)
                .font(.headline.bold())
                .fixedSize(horizontal: false, vertical: true)
            
            if let profilePhotoData = viewModel.item.profilePhoto, let profilePhotoImage = profilePhotoData.image {
                Image(uiImage: profilePhotoImage)
                    .resizable()
                    .frame(height: 200)
                    .cornerRadius(6)
                    .aspectRatio(contentMode: .fit)
            }
            
            if let photos = viewModel.item.photos {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8 ) {
                        ForEach(photos, id: \.self) { photo in
                            if let photoData = photo, let photoImage = photoData.image {
                                Image(uiImage: photoImage)
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width / 6, height: UIScreen.main.bounds.width / 6)
                                    .cornerRadius(6)
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                    }
                }
            }
            
            if let tags = viewModel.item.tags {
                TagsView(items: tags)
            }
            
            Spacer()
        }
        .padding(.vertical, 30)
        .padding(.horizontal, 18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "pencil")
                        .foregroundColor(.black)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "trash")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct DailyGratitudeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
