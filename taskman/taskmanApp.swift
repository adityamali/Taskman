//
//  taskmanApp.swift
//  taskman
//
//  Created by Aditya Mali on 11/05/24.
//

import SwiftUI

@main
struct taskmanApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands{
            CommandMenu("Task"){
                Button("Add New Task"){
                    
                }
                .keyboardShortcut(KeyEquivalent("t"), modifiers: .command)
            }
            CommandGroup(after: .newItem){
                Button("New Group"){
                    
                }
                .keyboardShortcut(KeyEquivalent("g"), modifiers: .command)
            }
        }
    }
}
