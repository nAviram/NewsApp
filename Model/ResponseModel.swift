//
//  ResponseModel.swift
//  NewsApp
//
//  Created by Aviram on 22/9/22.
//

import Foundation

//example:
/*
"status": "ok",
    "totalResults": 37,
    "articles": [
 */
struct ResponseModel: Codable {
    
    var status: String
    var totalResults: Int
    var articles: [Article]
    
}
