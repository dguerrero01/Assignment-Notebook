//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Student on 1/13/22.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems = [AssignmentItem(course: "Math", description: "Chapter 1 HW", dueDate: Date()), AssignmentItem(course: "Science", description: "Finish lab", dueDate: Date()), AssignmentItem(course: "Spanish", description: "Study vocab", dueDate: Date())]
    var body: some View {
        NavigationView {
            List {
                ForEach (assignmentItems) { assignmentItem in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(assignmentItem.course)
                                .font(.headline)
                            Text(assignmentItem.description)
                        }
                        Spacer()
                        Text(assignmentItem.dueDate, style: .date)
                    }
                }
                .onMove(perform: { indices, newOffset in
                    assignmentItems.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignmentItems.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle("Assignment List", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AssignmentItem: Identifiable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
