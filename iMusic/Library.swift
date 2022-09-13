//
//  Library.swift
//  iMusic
//
//  Created by Danya Kukhar on 12.09.2022.
//

import SwiftUI
import URLImage

struct Library: View {

    var tracks = UserDefaults.standard.savedTracks()
    
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { geometry in
                    HStack(spacing: 20) {
                        Button {
                            print("1,2,3,4,5")
                        } label: {
                            Image(systemName: "play.fill")
                                .frame(width: geometry.size.width / 2 - 10, height: 50)
                                .accentColor(Color(UIColor.red))
                                .background(Color.init(UIColor(.brown)))
                                .cornerRadius(10)
                        }
                        Button {
                            print("1,2,3,4,5")
                        } label: {
                            Image(systemName: "arrow.2.circlepath")
                                .frame(width: geometry.size.width / 2 - 10, height: 50)
                                .accentColor(Color(UIColor.red))
                                .background(Color.init(UIColor(.brown)))
                                .cornerRadius(10)
                        }
                        
                    }
                }.padding().frame(height: 50).padding(.bottom)
                List(tracks) { track in
                    LibraryCell(cell: track)
                }.listStyle(.plain)
            }
            .navigationBarTitle("Library")
        }
        
    }
    
}

struct LibraryCell: View {
    
    var cell: SearchViewModel.Cell
    
    var body: some View {
        HStack {
            let url: URL = URL(string: cell.iconUrlString ?? "")!
            URLImage(url) { image in
                    image
                    .resizable()
                    .frame(width: 60,
                           height: 60)
                    .cornerRadius(2)
            }
            VStack(alignment: .leading) {
                Text("\(cell.trackName)")
                Text("\(cell.artistName)")
            }
        }
    }
}

struct Library_Previews: PreviewProvider {
    static var previews: some View {
        Library()
    }
}
