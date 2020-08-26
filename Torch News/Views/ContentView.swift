//
//  ContentView.swift
//  Torch News
//
//  Created by Aswin Nair on 8/25/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.articles) { article in
                NavigationLink(destination: ArticleDetailView(article: article)) {
                    
                    HStack {
                        if let imageURL = article.urlToImage {
                            WebImage(url: URL(string: imageURL))
                                .resizable()
                                .placeholder {
                                    Rectangle().foregroundColor(.gray)
                                }
                                .indicator(.activity) // Activity Indicator
                                .transition(.fade(duration: 0.5)) // Fade Transition with duration
                                .cornerRadius(12)
                                .frame(width: 100, height: 100, alignment: .center)
                                .padding()
                        } else {
                            Rectangle()
                                .foregroundColor(.gray)
                                .frame(width: 100, height: 100, alignment: .center)
                                .cornerRadius(12)
                                .padding()
                        }
                        
                        Text(article.title)
                    }
                }
            }
            
            .navigationBarTitle("Top News")
        }
        .accentColor(.white)
        .onAppear {
            self.networkManager.fetchTopHeadlines()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
