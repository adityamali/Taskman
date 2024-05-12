//
//  Task.swift
//  taskman
//
//  Created by Aditya Mali on 11/05/24.
//

import Foundation

struct Task: Identifiable, Hashable{
    
    let id = UUID()
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var details: String?
    
    init(title: String, isComplete: Bool = false, dueDate: Date = Date(), details: String? = nil) {
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.details = details
    }
    
    static func example() -> Task{
        Task(title: "Buy milk", isComplete: true , dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!)
    }
    
    static func examples()-> [Task]{
        [
        Task(title: "Here's to the crazy ones"),
        Task(title: "the misfits, the rebels, the troublemakers", isComplete: true),
        Task(title: "the round pegs in the square holes.", dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!),
        Task(title: "the ones who see things differently - they're not fond of rules..."),
        Task(title: "You can quote them, disagree with them, glorify or vilify them", isComplete: true, details: "Lorem ipsum text explaination kuch toh kuch toh"),
        ]
    }
}
