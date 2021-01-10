//
//  AppSync.swift
//  UserDevice
//
//  Created by YuHan Hsiao on 2020/12/06.
//

import Foundation
import AWSAppSync
import AWSMobileClient

protocol AppSyncDelegate {
    func onTodoCreated(_ todo: Todo)
    func onTodoDeleted(_ todo: Todo)
    func onTodoUpdated(_ todo: Todo)
    func reconnected()
}

class AppSync {
    
    static let shared = AppSync()
    var appSyncClient: AWSAppSyncClient!
    
    var delegate: AppSyncDelegate?
    var subId: String?
    var connectionState: ClientNetworkAccessState = .Online
    var createSubscription: AWSAppSyncSubscriptionWatcher<OnCreateTodoSubscription>?
    var deleteSubscription: AWSAppSyncSubscriptionWatcher<OnDeleteTodoSubscription>?
    var updateSubscription: AWSAppSyncSubscriptionWatcher<OnUpdateTodoSubscription>?
    
    // MARK: - Set up
    func setupAppSyncWithSubId(_ subId: String) {
        let cacheConfiguration = AWSAppSyncCacheConfiguration.inMemory
        let appSyncConfig = try! AWSAppSyncClientConfiguration(url: URL(string: "https://xxxxx.appsync-api.ap-northeast-2.amazonaws.com/graphql")!,
                                                               serviceRegion: .APNortheast2,
                                                               apiKeyAuthProvider: nil,
                                                               credentialsProvider: AWSMobileClient.default(),
                                                               oidcAuthProvider: nil,
                                                               userPoolsAuthProvider: nil,
                                                               urlSessionConfiguration: URLSessionConfiguration.default,
                                                               cacheConfiguration: cacheConfiguration,
                                                               connectionStateChangeHandler: self,
                                                               s3ObjectManager: nil,
                                                               presignedURLClient: nil,
                                                               retryStrategy: .aggressive)
        appSyncClient = try! AWSAppSyncClient(appSyncConfig: appSyncConfig)
        appSyncClient.apolloClient?.cacheKeyForObject = { $0["id"] }
        self.subId = subId
        AppSync.shared.subscribeOnTodoCreation()
        AppSync.shared.subscribeOnTodoDeletion()
        AppSync.shared.subscribeOnTodoUpdated()
    }
    
    // MARK: - Cancel
    func cancel() {
        createSubscription?.cancel()
        deleteSubscription?.cancel()
        updateSubscription?.cancel()
    }
    
    // MARK: - List devices
    func listTodos(_ result: @escaping (Result<[Todo]>) -> Void) {
        let input = TableTodoFilterInput(subId: TableStringFilterInput(eq: subId))
        let query = ListTodosQuery(filter: input)
        
        appSyncClient.fetch(query: query, cachePolicy: CachePolicy.fetchIgnoringCacheData) { fetchResult, error  in
            if let error = error {
                result(.failure(error))
            } else {
                let devices = fetchResult?.data?.listTodos?.items?.compactMap { item -> Todo? in
                    guard let id = item?.id,
                          let task = item?.task,
                          let isFinished = item?.isFinished,
                          let date = item?.taskDate else {
                        return nil
                    }
                    return Todo(id: id, task: task, isFinished: isFinished, date: Date(timeIntervalSince1970: TimeInterval(date)))
                }
                result(.success(devices ?? []))
            }
        }
    }
    
    // MARK: - Create device
    func createTodo(_ todo: Todo) {
        let input = CreateTodoInput(id: todo.id, subId: subId!, task: todo.task, isFinished: false, taskDate: Int(todo.taskDate.timeIntervalSince1970))
        let mutation = CreateTodoMutation(input: input)
        appSyncClient.perform(mutation: mutation, resultHandler:  { result, error in
            print(result ?? error!)
        })
    }
    
    func removeTodo(_ todo: Todo) {
        guard let subId = subId else {
            return
        }
        let input = DeleteTodoInput(id: todo.id, subId: subId)
        let mutation = DeleteTodoMutation(input: input)
        appSyncClient.perform(mutation: mutation, resultHandler:  { result, error in

        })
    }
    
    func modifyTodo(_ todo: Todo) {
        guard let subId = subId else {
            return
        }
        
        let input = UpdateTodoInput(id: todo.id,
                                    subId: subId,
                                    task: todo.task,
                                    isFinished: todo.isFinished,
                                    taskDate: Int(todo.taskDate.timeIntervalSince1970))
        let mutation = UpdateTodoMutation(input: input)
        appSyncClient.perform(mutation: mutation, resultHandler: { result, error in
            
        })
    }
    
    func subscribeOnTodoCreation() {
        guard let subId = subId else {
            return
        }
        let subscription = OnCreateTodoSubscription(subId: subId)
        self.createSubscription = try! self.appSyncClient.subscribe(subscription: subscription) { status in
            print("📡 Creation subscription", status)
        } resultHandler: { [weak self] result, transaction, error in
            if let data = result?.data,
               let onCreate = data.onCreateTodo  {
                let date = Date(timeIntervalSince1970: TimeInterval(onCreate.taskDate))
                let todo = Todo(id: onCreate.id, task: onCreate.task, isFinished: onCreate.isFinished, date: date)
                self?.delegate?.onTodoCreated(todo)
            }
        }
    }
    
    func subscribeOnTodoDeletion() {
        guard let subId = subId else {
            return
        }
        
        let subscription = OnDeleteTodoSubscription(subId: subId)
        self.deleteSubscription = try! self.appSyncClient.subscribe(subscription: subscription) { status in
            print("📡 Deletion subscription", status)
        } resultHandler: { [weak self] result, transaction, error in
            if let data = result?.data,
               let onDelete = data.onDeleteTodo {
                let todo = Todo(id: onDelete.id, task: onDelete.task, isFinished: onDelete.isFinished, date: Date(timeIntervalSince1970: TimeInterval(onDelete.taskDate)))
                self?.delegate?.onTodoDeleted(todo)
            }
        }
    }
    
    func subscribeOnTodoUpdated() {
        guard let subId = subId else {
            return
        }
        let subscription = OnUpdateTodoSubscription(subId: subId)
        self.updateSubscription = try! self.appSyncClient.subscribe(subscription: subscription) { status in
            print("📡 Updated subscription", status)
        } resultHandler: { [weak self] result, transaction, error in
            if let data = result?.data,
               let onUpdate = data.onUpdateTodo {
                let todo = Todo(id: onUpdate.id, task: onUpdate.task, isFinished: onUpdate.isFinished, date: Date(timeIntervalSince1970: TimeInterval(onUpdate.taskDate)))
                self?.delegate?.onTodoUpdated(todo)
            }
        }
    }
}

extension AppSync: ConnectionStateChangeHandler {
    func stateChanged(networkState: ClientNetworkAccessState) {
        if self.connectionState != networkState, networkState == .Online {
            cancel()
            subscribeOnTodoCreation()
            subscribeOnTodoDeletion()
            delegate?.reconnected()
        }
        self.connectionState = networkState
    }
}
