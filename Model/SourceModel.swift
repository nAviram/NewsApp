//
//  SourceModel.swift
//  NewsApp
//
//  Created by Aviram on 22/9/22.
//

import Foundation


//for example:
//          "source": {
//                "id": "cnn",
//                "name": "CNN"
//            },

struct Source : Codable, Equatable {
    var id : String?
    var name : String?
    
}
