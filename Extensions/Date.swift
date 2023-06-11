//
//  Date.swift
//  AsyncAwaitDemo
//
//  Created by pnam on 12/06/2023.
//

import Foundation

extension Date {
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
    
    private static let fullFomatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "dd/MM/yyyy • HH:mm"
        return dateFormatter
    }()
    
//    public var timeAgo: String {
//        let timeAgoType = TimeAgoType.getTimeAgo(fromDate: self, upto: .day)
//        switch timeAgoType {
//        case .minute(let diff):
//            return Strings.FastNews.minuteAgo(diff)
//        case .hour(let diff):
//            return Strings.FastNews.hoursAgo(diff)
//        case .day(let diff):
//            if (diff <= 1) {
//                return Strings.FastNews.yesterday
//            } else {
//                return Strings.FastNews.dayAgo(diff)
//            }
//        case .week(diff: let diff):
//            return Strings.FastNews.weekAgo(diff)
//        case .month(diff: let diff):
//            return Strings.FastNews.monthAgo(diff)
//        case .year(diff: let diff):
//            return Strings.FastNews.yearAgo(diff)
//        default:
//            return dateMonthYearTime
//        }
//    }
    
    public var dateMonthYearTime: String {
        let dateFormatter = Self.dateFormatter
        return dateFormatter.string(from: self)
    }
    
    public var fullTime: String {
        Self.fullFomatter.string(from: self)
    }
}

private extension Date {
    private enum TimeAgoType {
        case minute(diff: Int)
        case hour(diff: Int)
        case day(diff: Int)
        case week(diff: Int)
        case month(diff: Int)
        case year(diff: Int)
        case `default`
        
        public static func getTimeAgo(fromDate: Date, upto: Calendar.Component) -> TimeAgoType {
            let calendar = Calendar.current
            let hourAgo = calendar.date(byAdding: .hour, value: -1, to: Date())!
            let dayAgo = calendar.date(byAdding: .day, value: -1, to: Date())!
            let weekAgo = calendar.date(byAdding: .day, value: -7, to: Date())!
            let monthAgo = calendar.date(byAdding: .month, value: -1, to: Date())!
            let yearAgo = calendar.date(byAdding: .year, value: -1, to: Date())!
            
            if hourAgo < fromDate || upto == .minute {
                let diff = Calendar.current.dateComponents([.minute], from: fromDate, to: Date()).minute ?? 0
                return .minute(diff: max(diff,1))
            } else if dayAgo < fromDate || upto == .hour {
                let diff = Calendar.current.dateComponents([.hour], from: fromDate, to: Date()).hour ?? 0
                return .hour(diff: diff)
            } else if weekAgo < fromDate || upto == .day {
                let diff = Calendar.current.dateComponents([.day], from: fromDate, to: Date()).day ?? 0
                if diff <= 3 {
                    return .day(diff: diff)
                } else {
                    return .default
                }
            } else if monthAgo < fromDate || upto == .weekOfYear {
                let diff = Calendar.current.dateComponents([.weekOfYear], from: fromDate, to: Date()).weekOfYear ?? 0
                return .week(diff: diff)
            } else if yearAgo < fromDate || upto == .month {
                let diff = Calendar.current.dateComponents([.month], from: fromDate, to: Date()).month ?? 0
                return .month(diff: diff)
            }
            let diff = Calendar.current.dateComponents([.year], from: fromDate, to: Date()).month ?? 0
            return .year(diff: diff)
        }
    }
}
