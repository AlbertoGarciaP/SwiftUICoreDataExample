//
//  ReminderRow.swift
//  SwiftUICoreDataExample
//
//  Created by Alberto Garcia on 09/06/21.
//

import SwiftUI

struct ReminderRow: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var reminder: Reminder
    
    var body: some View {
        Toggle(isOn: $reminder.completion, label: {
            Text(reminder.title ?? "")
                .font(.system(.title2, design: .rounded))
                .fontWeight(.heavy)
                .padding(.vertical, 12)
                .animation(.default)
        })
        .toggleStyle(CheckboxStyle())
    }
}

struct ReminderRow_Preview: PreviewProvider {
    static var previews: some View {
        ReminderRow(text: "Some Text")
    }
}
