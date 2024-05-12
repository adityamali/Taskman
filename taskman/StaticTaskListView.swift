//
//  TaskListView.swift
//  taskman
//
//  Created by Aditya Mali on 12/05/24.
//

import SwiftUI

struct StaticTaskListView: View {
    let title: String
    let tasks: [Task]
    
    
    var body: some View {
        List(tasks){ task in
            HStack{
                Image(systemName: task.isComplete ? "largecircle.fill.circle" : "circle")
                Text(task.title)
            }
        }
    }
}

#Preview {
    StaticTaskListView(title: "All", tasks: Task.examples())
}
