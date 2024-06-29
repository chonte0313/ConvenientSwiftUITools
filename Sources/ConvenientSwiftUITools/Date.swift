//
//  File.swift
//  
//
//  Created by Jung Tae Cha on 6/28/24.
//

import Foundation
import SwiftUI

@available(iOS 15.0, macOS 11.0, *)
extension Date{
    public func isSameDate(_ date: Date) -> Bool{
        return self.formatted(date: .abbreviated, time: .omitted) == date.formatted(date: .abbreviated, time: .omitted)
    }
}

@available(iOS 14.0, macOS 11.0, *)
extension Date{
    public func getAllDatesOfThisWeek() -> [Date] {
        let calendar = Calendar.current
        
        // Get the start of the current week
        let weekOfYear = calendar.component(.weekOfYear, from: self)
        let yearForWeekOfYear = calendar.component(.yearForWeekOfYear, from: self)
        
        guard let startOfWeek = calendar.date(from: DateComponents(weekOfYear: weekOfYear, yearForWeekOfYear: yearForWeekOfYear)) else {
            return []
        }
        
        // Create an array to hold all the dates
        var weekDates: [Date] = []
        
        // Populate the array with all dates of the week
        for dayOffset in 0..<7 {
            if let date = calendar.date(byAdding: .day, value: dayOffset, to: startOfWeek) {
                weekDates.append(date)
            }
        }
        
        return weekDates
    }
}
