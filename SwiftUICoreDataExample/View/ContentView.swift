//
//  ContentView.swift
//  SwiftUICoreDataExample
//
//  Created by Alberto Garcia on 08/06/21.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    
    @State var example = [
        "title1",
        "title2",
        "title3",
        "title4",
        "title5"
    ]
    
    @State private var showNewReminder: Bool = false
    
    // Fetch data
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Reminder.timestamp, ascending: true)], animation: .default)
    private var reminders: FetchedResults<Reminder>
    
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(reminders) { reminder in
                        ReminderRow(reminder: reminder)
                    }
                    .onDelete(perform: remove)
                } //: List
                .toolbar {
                    Button(action: {
                        showNewReminder.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
                .listStyle(InsetGroupedListStyle())
                .navigationTitle("Reminders")
                
                if showNewReminder {
                    BlankView(backgroundColor: .gray,
                              backgroundOpacity: 0.5)
                        .onTapGesture {
                            withAnimation {
                                showNewReminder.toggle()
                            }
                        }
                    NewReminderView(isShowing: $showNewReminder)
                }
            } //: ZStack
        } //: NavigationView
    } //: body
    
    private func remove(offset: IndexSet) {
        example.remove(atOffsets: offset)
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
