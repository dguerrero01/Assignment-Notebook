//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Student on 1/19/22.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var assignmentItems = [AssignmentItem(course: "Math", description: "Chapter 1 HW", dueDate: Date()), AssignmentItem(course: "Science", description: "Finish lab", dueDate: Date()), AssignmentItem(course: "English", description: "Study vocab", dueDate: Date())]
}
