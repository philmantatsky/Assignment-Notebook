//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by Phillip Mantatsky on 2/8/24.
//

import SwiftUI

struct AddAssignmentView: View {
    @ObservedObject var assignmentList : AssignmentList
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let courses = ["High", "Medium", "Low"]
    var body: some View {
        NavigationView {
            Form {
                Picker("course", selection: $course) {
                    ForEach(Self.courses, id: \.self) { course in
                        Text(course)
                    }
                }
            }
        }
    }
}

struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentView(assignmentList: AssignmentList())
    }
}
