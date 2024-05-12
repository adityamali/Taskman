//
//  TaskListView.swift
//  taskman
//
//  Created by Aditya Mali on 12/05/24.
//

import SwiftUI

struct TaskListView: View {
    let title: String
    @Binding var tasks: [Task]
    
    
    var body: some View {
        List($tasks){ $task in
            TaskView(task: $task)
        }
        .toolbar{
            Button{
                tasks.append(Task(title: "New Task"))
            }label: {
                Label("Add new task", systemImage: "plus")
            }
        }
    }
}

#Preview {
    TaskListView(title: "All", tasks: .constant(Task.examples()))
}
