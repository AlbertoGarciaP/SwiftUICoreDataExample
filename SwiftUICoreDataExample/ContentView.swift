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
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            List {
                ForEach(example, id: \.self) { text in
                    Text(text)
                }
                .onDelete(perform: { indexSet in
                    print("Delete index: \(indexSet)")
                })
                
            } //: List
            .toolbar {
                Button(action: {
                    example.append("title6")
                }, label: {
                    Image(systemName: "plus")
                })
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Reminders")
        } // NavigationView
    } //: body
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
