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
            Text(article.title)
                .bold()
        }
        .padding(2)
    }
}

struct ArticleView_Previews: PreviewProvider {
    
    static var previews: some View {
        ArticleView(article: Article.getExampleArticle())
        
    }
}
