//
//  ContentViewModel.swift
//  Calendar
//
//  Created by Ryo on 2022/11/08.
//

import Foundation
import EventKit

class ContentViewModel: ObservableObject {
    
    var eventManager = EventManager()
    @Published var menu = "全て"
    @Published var data:[EKEvent] = []
    
    func predicateForReminders(){
        data = eventManager.predicateForEvents()
        //print(eventManager.predicateForReminders())
    }
    
    init() {
        data = eventManager.predicateForEvents()
    }
    
}
