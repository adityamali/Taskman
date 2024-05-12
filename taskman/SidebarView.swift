//
//  SidebarView.swift
//  taskman
//
//  Created by Aditya Mali on 12/05/24.
//

import SwiftUI

struct SidebarView: View {
    
    @Binding var userCreatedGroups: [TaskGroup]
    @Binding var selection: TaskSection?
    
    var body: some View {
        List(selection: $selection){
            ForEach(TaskSection.allCases){ selection in
                Label(selection.displayName, systemImage: selection.icons)
                    .tag(selection)
            }
            Section("My Groups"){
                ForEach($userCreatedGroups) { $group in
                    HStack{
                        Image(systemName: "folder")
                        TextField("New Group", text: $group.title)
                    }
                        .tag(TaskSection.list(group))
                        .contextMenu{
                            Button("Delete", role: .destructive){
                                if let index = userCreatedGroups.firstIndex(where: {$0.id == group.id}){
                                    userCreatedGroups.remove(at: index)
                                }
                            }
                        }
                }
            }
        }
        .safeAreaInset(edge: .bottom){
            Button(action:{
                let newGroup = TaskGroup(title: "New Group")
                userCreatedGroups.append(newGroup)
            }, label: {
                Label("New Group", systemImage: "plus.circle")
            })
            .buttonStyle(.borderless)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .keyboardShortcut(KeyEquivalent("a"), modifiers: .command)
        }
    }
}

#Preview {
    SidebarView(userCreatedGroups: .constant(TaskGroup.examples()), selection: .constant(.all))
        .listStyle(.sidebar)
}
