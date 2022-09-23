//
//  Date_Extension.swift
//  NewsApp
//
//  Created by Aviram on 22/9/22.
//

import Foundation


extension Date {

    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }

}
