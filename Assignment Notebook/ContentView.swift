//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Student on 1/13/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    var body: some View {
        NavigationView {
            List {
                ForEach (assignmentList.assignmentItems) { assignmentItem in
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
                    assignmentList.assignmentItems.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignmentList.assignmentItems.remove(atOffsets: indexSet)
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
