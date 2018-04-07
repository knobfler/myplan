//
//  SharedCalendar.swift
//  MyPlan
//
//  Created by 최동호 on 2018. 4. 5..
//  Copyright © 2018년 최동호. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let MoveToNextCalender = Notification.Name("MoveToNextCalender")
    static let SelectDateDone = Notification.Name("SelectDateDone")
}

class SharedCalendar {
    static let shared = SharedCalendar()
    
    var departDate: Date?
    var arriveDate: Date?
    
    var numberOfDays: Int?
    
    var selectedDateArray: [Date]?

}

extension SharedCalendar {
    func initialize() {
        self.departDate = nil
        self.arriveDate = nil
        self.numberOfDays = nil
        self.selectedDateArray = nil
    }
}
