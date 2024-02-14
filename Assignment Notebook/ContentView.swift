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
                List {
                    ForEach(assignmentList.items) { item in
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Text(item.course)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(item.description)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            Text(item.dueDate, style: .date)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(item.course == "Math" ? Color.red.opacity(0.7) :
                                        (item.course == "Science" ? Color.yellow.opacity(0.7) :
                                            (item.course == "History" ? Color.green.opacity(0.7) :
                                                (item.course == "PE" ? Color.orange.opacity(0.7) :
                                                    (item.course == "English" ? Color.purple.opacity(0.7) :
                                                Color.gray.opacity(0.7))))))
                        .cornerRadius(8)
                        .padding(.vertical, 4)
                        .shadow(radius: 2)
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
