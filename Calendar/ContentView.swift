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
        VStack {
            

            List {
                ForEach(ViewModel.data, id: \.self) { reminders in
                    
                    
                    Text(reminders.title)
                    
                }
            }
            .refreshable {
                //リストの更新
                ViewModel.predicateForReminders()
            }
        }
        .padding()
        .task {
            ViewModel.predicateForReminders()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
