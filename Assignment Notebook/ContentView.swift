//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Student on 1/13/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentItems: AssignmentItems
    @State private var showingAddAssignmentsView = false
    var body: some View {
        NavigationView {
            List {
                ForEach (assignmentItems) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.priority)
                                .font(.headline)
                            Text(item.description)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                }
                
            }
            .onMove(perform: { indices, newOffset in
                assignmentItems.move(fromOffsets: indices, toOffset: newOffset)
            })
            .onDelete(perform: { indexSet in
                assignmentItems.remove(atOffsets: indexSet)
            })
        }
        .navigationBarTitle("Assignment Notebook")
        .sheet(isPresented: $showingAddAssignmentsView, content: {
            AddAssignmentsView(assignmentsItems: AssignmentItems)
        })
        
        .navigationBarItems(leading: EditButton(),
                            trailing: Button(action: {
                                                $showingAddAssignmentsView = true}) {
                                Image(systemName: "plus")
                            })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(assignmentItems: AssignmentItems())
    }
}

struct AssignmentItem: Identifiable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
