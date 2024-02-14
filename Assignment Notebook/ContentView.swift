//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Phillip Mantatsky on 2/1/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddAssignmentView = false
    var body: some View {
        NavigationView {
            ZStack {
                Color.red.opacity(0.7).ignoresSafeArea()
                List {
                    ForEach(assignmentList.items) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.course)
                                    .font(.headline)
                                Text(item.description)
                            }
                            Spacer()
                            Text(item.dueDate, style: .date)
                        }
                    }
                    .onMove (perform:  { indices, newOffset in
                        assignmentList.items.move(fromOffsets: indices, toOffset: newOffset)
                    })
                    .onDelete (perform: { indexSet in
                        assignmentList.items.remove(atOffsets: indexSet)
                    })
                }
                .sheet(isPresented: $showingAddAssignmentView, content: {
                    AddAssignmentView(assignmentList: assignmentList)
                })
                .navigationBarTitle("Assignments", displayMode: .inline)
                .navigationBarItems(leading: EditButton(), trailing:
                                        Button (action: {
                    showingAddAssignmentView = true }) {
                        Image(systemName: "plus")
                    })
            }
            .onAppear {
                       UITableView.appearance().backgroundColor = .clear
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
