//
//  Constants.swift
//  NewsApp
//
//  Created by Aviram on 22/9/22.
//

import Foundation
import SwiftUI

struct Constants{
    
    static let baseUrl = "https://newsapi.org/v2/"
    
    static let top_headlines = "top-headlines"
    
    static let everything = "everything"
    
    //API Params:
    static let apiValue = "b2d9f0c85995458285ff4e597c4ae536"
    
    static let sortByDefault = "popularity"
    
    static let fromDateDefault = "2022-09-22"
    
    static let subjectDefault = "Apple"
    
    
    //UI Params:
    static let ImageFrameWidth : CGFloat = 130
    static let ImageFrameHeight : CGFloat = 70
    
    //Filters:
    static let languages = ["ENGLISH", "עברית"]
    
    static let languagesValues = ["ENGLISH":"en", "עברית":"he"]
}

