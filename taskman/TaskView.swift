//
//  TaskView.swift
//  taskman
//
//  Created by Aditya Mali on 12/05/24.
//

import SwiftUI

struct TaskView: View {
    @Binding var task: Task
    
    var body: some View {
        HStack{
            Image(systemName: task.isComplete ? "largecircle.fill.circle" : "circle")
                .onTapGesture{
                    task.isComplete.toggle()
                }
            TextField("New Title", text: $task.title).textFieldStyle(.plain)
        }
    }
}

#Preview {
    TaskView(task: .constant(Task.example()))
        .padding()
}
