//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Phillip Mantatsky on 2/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems =
            [AssignmentItem(course: "High", description: "Take out trash", dueDate: Date()),
             AssignmentItem(course: "Medium", description: "Pick up clothes", dueDate: Date()),
             AssignmentItem(course: "Low", description: "Eat a donut", dueDate: Date())]
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentItems) { item in
                            Text(item.description)
                    }
                .navigationBarTitle("Things", displayMode: .inline)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AssignmentItem: Identifiable, Codable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
