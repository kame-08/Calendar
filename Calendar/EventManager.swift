//
//  EventManager.swift
//  Calendar
//
//  Created by Ryo on 2022/11/08.
//

import Foundation
import EventKit

class EventManager {
    var store = EKEventStore()
    
    var hoge: [EKCalendar] = []
    init(){
        self.store = EKEventStore()
        
        func authorizationStatus() -> Bool {
            let status = EKEventStore.authorizationStatus(for: .event)
            
            switch status {
            case .authorized:
                print("Authorized")
                return true
            case .notDetermined:
                print("Not determined")
                return false
            case .restricted:
                print("Restricted")
                return false
            case .denied:
                print("Denied")
                return false
            @unknown default:
                print("Unknown default")
                return false
            }
        }
        
        store.requestAccess(to: .event, completion: { granted, error in
            if granted {
                print("allowed now")
                return
            }
            else {
                print("Not allowed")
            }
        })
        
        predicateForEvents()
    }
    
    
    
    func predicateForEvents() -> [EKEvent]{
        //1年前
        let startDate = Date(timeIntervalSinceNow: -365.0 * 24.0 * 60.0 * 60.0)
        let endDate = Date()
        let defaultCalendar = store.defaultCalendarForNewEvents
        var predicate: NSPredicate? = store.predicateForEvents(withStart: startDate, end: endDate, calendars: [defaultCalendar!])
        let events = store.events(matching: predicate!)
        //        if let aPredicate = predicate {
        //            store.fetchReminders(matching: aPredicate, completion: {(_ events: [Any]?) -> Void in
        //                self.hoge = []
        //                for event: EKCalendar? in events as? [EKCalendar?] ?? [EKCalendar?]() {
        //                    // Do something for each reminder.
        //                    // リマインダーのたびに何かをする。
        //                    self.hoge += [event!]
        //                }
        //            })
        //        }
        print("更新完了", hoge)
//        return events
        return events
    }
    
}
