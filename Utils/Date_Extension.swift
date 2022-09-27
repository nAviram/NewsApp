//
//  Date_Extension.swift
//  NewsApp
//
//  Created by Aviram on 22/9/22.
//

import Foundation


//add the ability to substruct 2 dates
extension Date {

    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
    
//    static func getFormatedDateFromISO8601(iso8601formatDate: String) -> String{
//        let stringDate = "2016-05-14T09:30:00.000Z" // ISO 8601 format
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mmZ" // ISO 8601
//
//        dateFormatter.date
//        let date = dateFormatter.dateFromString(iso8601formatDate)
//        
//    }

}
