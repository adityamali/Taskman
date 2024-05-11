//
//  ContentView.swift
//  taskman
//
//  Created by Aditya Mali on 11/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = TaskSection.all
    
    @State private var allTasks = Task.examples()
    
    @State private var userCreatedGroups: [TaskGroup] = TaskGroup.examples()
    
    var body: some View {
        NavigationSplitView{
            SidebarView(userCreatedGroups: $userCreatedGroups, selection: $selection)
        } detail: {
            
            switch selection {
            case .all:
                TaskListView(title: "All", tasks: allTasks)
            case .done:
                TaskListView(title: "Done", tasks: allTasks.filter({$0.isComplete}))
            case .upcoming:
                TaskListView(title: "Upcoming", tasks: allTasks.filter({!$0.isComplete}))
            case .list(let taskGroup):
                TaskListView(title: taskGroup.title, tasks: taskGroup.tasks)
            }
        }
    }
}

#Preview {
    ContentView()
}
