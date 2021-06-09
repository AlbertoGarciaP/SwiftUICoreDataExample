//
//  NewReminderView.swift
//  SwiftUICoreDataExample
//
//  Created by Alberto Garcia on 08/06/21.
//

import SwiftUI

struct NewReminderView: View {
    
    // MARK: - Properties
    
    @State private var reminder: String = ""
    @Binding var isShowing: Bool
    
    private var isButtonDisabled: Bool {
        reminder.isEmpty
    }
    
    // MARK: - Body
    
    private func addReminder() {
        withAnimation {
            isShowing = false
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 16) {
                TextField("New reminder", text: $reminder)
                    .foregroundColor(.blue)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: {
                    addReminder()
                }, label: {
                    Spacer()
                    Text("Save")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                })
                .disabled(isButtonDisabled)
                .padding()
                .foregroundColor(.white)
                .background(isButtonDisabled ? Color.blue : Color.pink)
                .cornerRadius(10)
            } //: VStack
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
            .frame(maxWidth: 640)
        } //: VStack
        .padding()
    }
}

// MARK: - Preview

struct NewReminderView_Previews: PreviewProvider {
    static var previews: some View {
        NewReminderView(isShowing: .constant(true))
            .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}
