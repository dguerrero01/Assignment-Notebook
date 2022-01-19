//
//  AddAssignmentsView.swift
//  Assignment Notebook
//
//  Created by Student on 1/18/22.
//

import SwiftUI

struct AddAssignmentsView: View {
    @ObservedObject var assignmentItems: AssignmentItems
        @State private var course = ""
        @State private var description = ""
        @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
        static let courses = ["Math", "Science", "Spanish"]
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddAssignmentsView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentsView(assignmentItems: AssignmentItems())
    }
}
