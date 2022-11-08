//
//  CalendarColumn.swift
//  Calendar
//
//  Created by Ryo on 2022/11/08.
//

import SwiftUI

struct CalendarColumn: View {
    @State var name: String
    @State var start: Date
    @State var end: Date
    @State var time: Int = 90
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(hoge(date:start))
            HStack {
                Spacer().frame(width: 10)
                ZStack {
                    Image(systemName: "circle")
                        .font(.largeTitle)
                    Text("\(time)")
                        .font(.title2)
                }
                Text(name)
                    .font(.title2)
                Spacer()
            }
            Text(hoge(date:end))
        }
    }
    
    func hoge (date:Date) -> String {
        let df = DateFormatter()
        df.calendar = Calendar(identifier: .gregorian)
        df.locale = Locale(identifier: "ja_JP")
        df.timeZone = TimeZone(identifier: "Asia/Tokyo")
        
        df.dateStyle = .none
        df.timeStyle = .short
        
        return df.string(from: date)
    }
}

struct CalendarColumn_Previews: PreviewProvider {
    static var previews: some View {
        CalendarColumn(name: "イベント", start: Date(), end: Date())
    }
}
