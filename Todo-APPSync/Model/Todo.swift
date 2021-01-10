//
//  Todo.swift
//  Todo-APPSync
//
//  Created by YuHan Hsiao on 2020/12/27.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var todos = [Todo]()
}

struct Todo: Codable, Hashable, Identifiable {
    init(id: String, task: String, isFinished: Bool, date: Date) {
        self.id = id
        self.task = task
        self.isFinished = isFinished
        self.taskDate = date
    }
    
    let id: String
    var task: String
    var isFinished: Bool
    var taskDate: Date
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case task = "task"
        case isFinished = "isFinished"
        case taskDate = "taskDate"
    }
}
