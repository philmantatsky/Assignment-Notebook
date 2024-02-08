//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Phillip Mantatsky on 2/7/24.
//

import Foundation
class AssignmentList: ObservableObject {
    @Published var items = [AssignmentItem(course: "High", description: "Take out trash", dueDate: Date()),
                            AssignmentItem(course: "Medium", description: "Pick up clothes", dueDate: Date()),
                            AssignmentItem(course: "Low", description: "Eat a donut", dueDate: Date())]
 }
