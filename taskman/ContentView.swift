//
//  ContentView.swift
//  taskman
//
//  Created by Aditya Mali on 11/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: TaskSection? = TaskSection.all
    
    @State private var allTasks = Task.examples()
    
    @State private var userCreatedGroups: [TaskGroup] = TaskGroup.examples()
    
    @State private var searchTearm: String = ""
    
    var body: some View {
        NavigationSplitView{
            SidebarView(userCreatedGroups: $userCreatedGroups, selection: $selection)
        } detail: {
            
            if searchTearm.isEmpty{
                switch selection {
                case .all:
                    TaskListView(title: "All", tasks: $allTasks)
                case .done:
                    StaticTaskListView(title: "Done", tasks: allTasks.filter({$0.isComplete}))
                case .upcoming:
                    StaticTaskListView(title: "Upcoming", tasks: allTasks.filter({!$0.isComplete}))
                case .list(let taskGroup):
                    StaticTaskListView(title: taskGroup.title, tasks: taskGroup.tasks)
                case .none:
                    TaskListView(title: "All", tasks: $allTasks)
                }
            } else {
                StaticTaskListView(title: "All", tasks: allTasks.filter({$0.title.contains(searchTearm)}))
            }
        }
        .searchable(text: $searchTearm)
    }
}

#Preview {
    ContentView()
}
