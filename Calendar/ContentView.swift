//
//  ContentView.swift
//  Calendar
//
//  Created by Ryo on 2022/11/08.
//

import SwiftUI

struct ContentView: View {
    @State var ViewModel = ContentViewModel()
    var body: some View {
        List {
            ForEach(ViewModel.data, id: \.self) { reminders in
                Section {
                    CalendarColumn(name: reminders.title, start: reminders.startDate, end: reminders.endDate)
                }
            }
        }
        .refreshable {
            //リストの更新
            ViewModel.predicateForReminders()
        }
//        .task {
//            ViewModel.predicateForReminders()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
