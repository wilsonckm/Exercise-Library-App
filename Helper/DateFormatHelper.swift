//
//  DateFormat.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/24/24.
//

import Foundation

struct DateFormatHelper {
    
   static func dayOfMonth(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d" // Day of month as a number
        return formatter.string(from: date)
    }
    
    static func abbreviateMonth(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter.string(from: date)
    }
    
}
