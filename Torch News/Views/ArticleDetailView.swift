//
//  ArticleDetailView.swift
//  Torch News
//
//  Created by Aswin Nair on 8/25/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct ArticleDetailView: View {
    
    let article: Article
    
    var body: some View {
        VStack {
            if let imageURL = article.urlToImage {
                WebImage(url: URL(string: imageURL))
                    .resizable()
                    .placeholder {
                        Rectangle().foregroundColor(.gray)
                    }
                    .indicator(.activity) // Activity Indicator
                    .transition(.fade(duration: 0.5)) // Fade Transition with duration
                    .scaledToFit()
                    .frame(alignment: .center)
            }
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.title)
                    .padding()
                
                if let author = article.author {
                    Text("Written by: " + author)
                        .font(.title3)
                        .padding()
                }
                
                if let articleBody = article.content {
                    Text(articleBody)
                        .font(.body)
                        .padding()
                }
            }
            
            Spacer()
        } .edgesIgnoringSafeArea(.all)
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: Article(author: "Test author", title: "This is a long test title that I'm testing", urlToImage: "https://i.insider.com/5f45233989aff80028ab7ba5?width=1200&;amp;format=jpeg", publishedAt: "Today", content: "A bunch of text goes here.asdlfjnasdlfknalsdkfnalsdkfnalsdkfnalsdkfnaldkfnalsdkfnalsdfknalsdkfnlkn"))
    }
}
