//
//  ArticleDetailsView.swift
//  NewsApp
//
//  Created by Aviram on 22/9/22.
//

import SwiftUI

struct ArticleDetailsView: View {
    
    let article : Article
    
    var body: some View {
        ScrollView([.vertical]) {
            
            VStack{
            Text(article.title)
                .font(.title)
            
            URLImageView(urlString: article.urlToImage, imageWidth: 350, imageHeight: 200)
            
            Text(article.description ?? "")
                .bold()
                .font(.title2)
            
            Spacer()
            
            HStack{
                if (article.publishedAt != nil){
                    Text(article.publishedAt!)
                        .bold()
                        .padding(3)
                }
                Spacer()
                if ((article.source.name) != nil){
                    Text("Source: " + article.source.name!)
                        .bold()
                        .padding(3)
                }                
            }
            
                Text(article.content ?? "")
                    .multilineTextAlignment(.leading)
                    .padding(10)
            }
                        
        }
    }
}

struct ArticleDetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
//        ArticleDetailsView()
        ArticleDetailsView(article: Article.getExampleArticle())
    }
}
