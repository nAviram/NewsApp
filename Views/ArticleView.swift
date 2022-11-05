//
//  ArticleView.swift
//  NewsApp
//
//  Created by Aviram on 22/9/22.
//

import SwiftUI

struct ArticleView: View {
    
    var article : Article
    
    var body: some View {
        
        HStack{
            URLImageView(urlString: article.urlToImage)
            VStack{
                if let publishedAt = article.publishedAt{
                    let displayDate = publishedAt.replacingOccurrences(of: "Z", with: "")
                        .replacingOccurrences(of: "T", with: " ")
                        .dropLast(3)
                    Text(displayDate)
                        .fontWeight(.thin)
                        .font(.system(size: 14))
                }
                Text(article.title)
                    .bold()
                    .font(.system(size: 15))
                    
            }
            .padding(2)
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    
    static var previews: some View {
        ArticleView(article: Article.getExampleArticle())
        
    }
}
