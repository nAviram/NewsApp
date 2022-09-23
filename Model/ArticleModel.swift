//
//  ArticleModel.swift
//  NewsApp
//
//  Created by Aviram on 22/9/22.
//

import Foundation


struct Article :  Codable, Hashable {
    
    static func == (lhs: Article, rhs: Article) -> Bool {
        if lhs.title == rhs.title &&
            lhs.author == rhs.author{
            return true
        }else{
            return false
        }
    }
    
    func hash(into hasher: inout Hasher){
        hasher.combine(title)
        hasher.combine(author)
    }
    
    var title : String
    var source : Source
    var url : String
    var author : String?
    var description : String?
    var urlToImage : String?
    var publishedAt : String?
    var content : String?
    
    //for testing purposes:
    static func getExampleArticle() -> Article{
        let source = Source(id: "12news", name: "12 News")
        let article = Article(title: "Elections 2022 - who will win?", source: source, url: "https://www.ynet.co.il/news/article/hylwosdzj?utm_source=taboola&utm_medium=referral&utm_content=internal", author: "Rina Matliach", description: "Elections Are Coming! Are you ready?", urlToImage: "https://ynet-images1.yit.co.il/picserver5/crop_images/2022/09/18/HkZ2V0Nbi/HkZ2V0Nbi_0_0_2215_3001_0_x-large.jpg", publishedAt: "2022-09-22", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. \n \n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        
        return article
    }
}
