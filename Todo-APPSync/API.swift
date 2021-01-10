//  This file was automatically generated and should not be edited.

import AWSAppSync

public struct CreateTodoInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: String, subId: String, task: String, isFinished: Bool, taskDate: Int) {
    graphQLMap = ["id": id, "subId": subId, "task": task, "isFinished": isFinished, "taskDate": taskDate]
  }

  public var id: String {
    get {
      return graphQLMap["id"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var subId: String {
    get {
      return graphQLMap["subId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "subId")
    }
  }

  public var task: String {
    get {
      return graphQLMap["task"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "task")
    }
  }

  public var isFinished: Bool {
    get {
      return graphQLMap["isFinished"] as! Bool
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "isFinished")
    }
  }

  public var taskDate: Int {
    get {
      return graphQLMap["taskDate"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "taskDate")
    }
  }
}

public struct UpdateTodoInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: String, subId: String, task: String, isFinished: Bool, taskDate: Int) {
    graphQLMap = ["id": id, "subId": subId, "task": task, "isFinished": isFinished, "taskDate": taskDate]
  }

  public var id: String {
    get {
      return graphQLMap["id"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var subId: String {
    get {
      return graphQLMap["subId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "subId")
    }
  }

  public var task: String {
    get {
      return graphQLMap["task"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "task")
    }
  }

  public var isFinished: Bool {
    get {
      return graphQLMap["isFinished"] as! Bool
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "isFinished")
    }
  }

  public var taskDate: Int {
    get {
      return graphQLMap["taskDate"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "taskDate")
    }
  }
}

public struct DeleteTodoInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: String, subId: String) {
    graphQLMap = ["id": id, "subId": subId]
  }

  public var id: String {
    get {
      return graphQLMap["id"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var subId: String {
    get {
      return graphQLMap["subId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "subId")
    }
  }
}

public struct TableTodoFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: TableStringFilterInput? = nil, subId: TableStringFilterInput? = nil) {
    graphQLMap = ["id": id, "subId": subId]
  }

  public var id: TableStringFilterInput? {
    get {
      return graphQLMap["id"] as! TableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var subId: TableStringFilterInput? {
    get {
      return graphQLMap["subId"] as! TableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "subId")
    }
  }
}

public struct TableStringFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: String? = nil, eq: String? = nil, le: String? = nil, lt: String? = nil, ge: String? = nil, gt: String? = nil, contains: String? = nil, notContains: String? = nil, between: [String?]? = nil, beginsWith: String? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith]
  }

  public var ne: String? {
    get {
      return graphQLMap["ne"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: String? {
    get {
      return graphQLMap["eq"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: String? {
    get {
      return graphQLMap["le"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: String? {
    get {
      return graphQLMap["lt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: String? {
    get {
      return graphQLMap["ge"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: String? {
    get {
      return graphQLMap["gt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: String? {
    get {
      return graphQLMap["contains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: String? {
    get {
      return graphQLMap["notContains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [String?]? {
    get {
      return graphQLMap["between"] as! [String?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: String? {
    get {
      return graphQLMap["beginsWith"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }
}

public final class CreateTodoMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateTodo($input: CreateTodoInput!) {\n  createTodo(input: $input) {\n    __typename\n    id\n    subId\n    task\n    isFinished\n    taskDate\n  }\n}"

  public var input: CreateTodoInput

  public init(input: CreateTodoInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createTodo", arguments: ["input": GraphQLVariable("input")], type: .object(CreateTodo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createTodo: CreateTodo? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createTodo": createTodo.flatMap { $0.snapshot }])
    }

    public var createTodo: CreateTodo? {
      get {
        return (snapshot["createTodo"] as? Snapshot).flatMap { CreateTodo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createTodo")
      }
    }

    public struct CreateTodo: GraphQLSelectionSet {
      public static let possibleTypes = ["Todo"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(String.self))),
        GraphQLField("subId", type: .nonNull(.scalar(String.self))),
        GraphQLField("task", type: .nonNull(.scalar(String.self))),
        GraphQLField("isFinished", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("taskDate", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String, subId: String, task: String, isFinished: Bool, taskDate: Int) {
        self.init(snapshot: ["__typename": "Todo", "id": id, "subId": subId, "task": task, "isFinished": isFinished, "taskDate": taskDate])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return snapshot["id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var subId: String {
        get {
          return snapshot["subId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "subId")
        }
      }

      public var task: String {
        get {
          return snapshot["task"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "task")
        }
      }

      public var isFinished: Bool {
        get {
          return snapshot["isFinished"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isFinished")
        }
      }

      public var taskDate: Int {
        get {
          return snapshot["taskDate"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "taskDate")
        }
      }
    }
  }
}

public final class UpdateTodoMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateTodo($input: UpdateTodoInput!) {\n  updateTodo(input: $input) {\n    __typename\n    id\n    subId\n    task\n    isFinished\n    taskDate\n  }\n}"

  public var input: UpdateTodoInput

  public init(input: UpdateTodoInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateTodo", arguments: ["input": GraphQLVariable("input")], type: .object(UpdateTodo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateTodo: UpdateTodo? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateTodo": updateTodo.flatMap { $0.snapshot }])
    }

    public var updateTodo: UpdateTodo? {
      get {
        return (snapshot["updateTodo"] as? Snapshot).flatMap { UpdateTodo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateTodo")
      }
    }

    public struct UpdateTodo: GraphQLSelectionSet {
      public static let possibleTypes = ["Todo"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(String.self))),
        GraphQLField("subId", type: .nonNull(.scalar(String.self))),
        GraphQLField("task", type: .nonNull(.scalar(String.self))),
        GraphQLField("isFinished", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("taskDate", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String, subId: String, task: String, isFinished: Bool, taskDate: Int) {
        self.init(snapshot: ["__typename": "Todo", "id": id, "subId": subId, "task": task, "isFinished": isFinished, "taskDate": taskDate])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return snapshot["id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var subId: String {
        get {
          return snapshot["subId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "subId")
        }
      }

      public var task: String {
        get {
          return snapshot["task"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "task")
        }
      }

      public var isFinished: Bool {
        get {
          return snapshot["isFinished"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isFinished")
        }
      }

      public var taskDate: Int {
        get {
          return snapshot["taskDate"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "taskDate")
        }
      }
    }
  }
}

public final class DeleteTodoMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteTodo($input: DeleteTodoInput!) {\n  deleteTodo(input: $input) {\n    __typename\n    id\n    subId\n    task\n    isFinished\n    taskDate\n  }\n}"

  public var input: DeleteTodoInput

  public init(input: DeleteTodoInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteTodo", arguments: ["input": GraphQLVariable("input")], type: .object(DeleteTodo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteTodo: DeleteTodo? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteTodo": deleteTodo.flatMap { $0.snapshot }])
    }

    public var deleteTodo: DeleteTodo? {
      get {
        return (snapshot["deleteTodo"] as? Snapshot).flatMap { DeleteTodo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteTodo")
      }
    }

    public struct DeleteTodo: GraphQLSelectionSet {
      public static let possibleTypes = ["Todo"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(String.self))),
        GraphQLField("subId", type: .nonNull(.scalar(String.self))),
        GraphQLField("task", type: .nonNull(.scalar(String.self))),
        GraphQLField("isFinished", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("taskDate", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String, subId: String, task: String, isFinished: Bool, taskDate: Int) {
        self.init(snapshot: ["__typename": "Todo", "id": id, "subId": subId, "task": task, "isFinished": isFinished, "taskDate": taskDate])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return snapshot["id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var subId: String {
        get {
          return snapshot["subId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "subId")
        }
      }

      public var task: String {
        get {
          return snapshot["task"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "task")
        }
      }

      public var isFinished: Bool {
        get {
          return snapshot["isFinished"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isFinished")
        }
      }

      public var taskDate: Int {
        get {
          return snapshot["taskDate"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "taskDate")
        }
      }
    }
  }
}

public final class GetTodoQuery: GraphQLQuery {
  public static let operationString =
    "query GetTodo($id: String!, $subId: String!) {\n  getTodo(id: $id, subId: $subId) {\n    __typename\n    id\n    subId\n    task\n    isFinished\n    taskDate\n  }\n}"

  public var id: String
  public var subId: String

  public init(id: String, subId: String) {
    self.id = id
    self.subId = subId
  }

  public var variables: GraphQLMap? {
    return ["id": id, "subId": subId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getTodo", arguments: ["id": GraphQLVariable("id"), "subId": GraphQLVariable("subId")], type: .object(GetTodo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getTodo: GetTodo? = nil) {
      self.init(snapshot: ["__typename": "Query", "getTodo": getTodo.flatMap { $0.snapshot }])
    }

    public var getTodo: GetTodo? {
      get {
        return (snapshot["getTodo"] as? Snapshot).flatMap { GetTodo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getTodo")
      }
    }

    public struct GetTodo: GraphQLSelectionSet {
      public static let possibleTypes = ["Todo"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(String.self))),
        GraphQLField("subId", type: .nonNull(.scalar(String.self))),
        GraphQLField("task", type: .nonNull(.scalar(String.self))),
        GraphQLField("isFinished", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("taskDate", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String, subId: String, task: String, isFinished: Bool, taskDate: Int) {
        self.init(snapshot: ["__typename": "Todo", "id": id, "subId": subId, "task": task, "isFinished": isFinished, "taskDate": taskDate])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return snapshot["id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var subId: String {
        get {
          return snapshot["subId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "subId")
        }
      }

      public var task: String {
        get {
          return snapshot["task"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "task")
        }
      }

      public var isFinished: Bool {
        get {
          return snapshot["isFinished"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isFinished")
        }
      }

      public var taskDate: Int {
        get {
          return snapshot["taskDate"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "taskDate")
        }
      }
    }
  }
}

public final class ListTodosQuery: GraphQLQuery {
  public static let operationString =
    "query ListTodos($filter: TableTodoFilterInput, $limit: Int, $nextToken: String) {\n  listTodos(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      subId\n      task\n      isFinished\n      taskDate\n    }\n    nextToken\n  }\n}"

  public var filter: TableTodoFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: TableTodoFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listTodos", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListTodo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listTodos: ListTodo? = nil) {
      self.init(snapshot: ["__typename": "Query", "listTodos": listTodos.flatMap { $0.snapshot }])
    }

    public var listTodos: ListTodo? {
      get {
        return (snapshot["listTodos"] as? Snapshot).flatMap { ListTodo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listTodos")
      }
    }

    public struct ListTodo: GraphQLSelectionSet {
      public static let possibleTypes = ["TodoConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "TodoConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Todo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("subId", type: .nonNull(.scalar(String.self))),
          GraphQLField("task", type: .nonNull(.scalar(String.self))),
          GraphQLField("isFinished", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("taskDate", type: .nonNull(.scalar(Int.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: String, subId: String, task: String, isFinished: Bool, taskDate: Int) {
          self.init(snapshot: ["__typename": "Todo", "id": id, "subId": subId, "task": task, "isFinished": isFinished, "taskDate": taskDate])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return snapshot["id"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var subId: String {
          get {
            return snapshot["subId"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "subId")
          }
        }

        public var task: String {
          get {
            return snapshot["task"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "task")
          }
        }

        public var isFinished: Bool {
          get {
            return snapshot["isFinished"]! as! Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "isFinished")
          }
        }

        public var taskDate: Int {
          get {
            return snapshot["taskDate"]! as! Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "taskDate")
          }
        }
      }
    }
  }
}

public final class OnCreateTodoSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateTodo($subId: String) {\n  onCreateTodo(subId: $subId) {\n    __typename\n    id\n    subId\n    task\n    isFinished\n    taskDate\n  }\n}"

  public var subId: String?

  public init(subId: String? = nil) {
    self.subId = subId
  }

  public var variables: GraphQLMap? {
    return ["subId": subId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateTodo", arguments: ["subId": GraphQLVariable("subId")], type: .object(OnCreateTodo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateTodo: OnCreateTodo? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateTodo": onCreateTodo.flatMap { $0.snapshot }])
    }

    public var onCreateTodo: OnCreateTodo? {
      get {
        return (snapshot["onCreateTodo"] as? Snapshot).flatMap { OnCreateTodo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateTodo")
      }
    }

    public struct OnCreateTodo: GraphQLSelectionSet {
      public static let possibleTypes = ["Todo"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(String.self))),
        GraphQLField("subId", type: .nonNull(.scalar(String.self))),
        GraphQLField("task", type: .nonNull(.scalar(String.self))),
        GraphQLField("isFinished", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("taskDate", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String, subId: String, task: String, isFinished: Bool, taskDate: Int) {
        self.init(snapshot: ["__typename": "Todo", "id": id, "subId": subId, "task": task, "isFinished": isFinished, "taskDate": taskDate])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return snapshot["id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var subId: String {
        get {
          return snapshot["subId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "subId")
        }
      }

      public var task: String {
        get {
          return snapshot["task"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "task")
        }
      }

      public var isFinished: Bool {
        get {
          return snapshot["isFinished"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isFinished")
        }
      }

      public var taskDate: Int {
        get {
          return snapshot["taskDate"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "taskDate")
        }
      }
    }
  }
}

public final class OnUpdateTodoSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateTodo($subId: String) {\n  onUpdateTodo(subId: $subId) {\n    __typename\n    id\n    subId\n    task\n    isFinished\n    taskDate\n  }\n}"

  public var subId: String?

  public init(subId: String? = nil) {
    self.subId = subId
  }

  public var variables: GraphQLMap? {
    return ["subId": subId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateTodo", arguments: ["subId": GraphQLVariable("subId")], type: .object(OnUpdateTodo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateTodo: OnUpdateTodo? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateTodo": onUpdateTodo.flatMap { $0.snapshot }])
    }

    public var onUpdateTodo: OnUpdateTodo? {
      get {
        return (snapshot["onUpdateTodo"] as? Snapshot).flatMap { OnUpdateTodo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateTodo")
      }
    }

    public struct OnUpdateTodo: GraphQLSelectionSet {
      public static let possibleTypes = ["Todo"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(String.self))),
        GraphQLField("subId", type: .nonNull(.scalar(String.self))),
        GraphQLField("task", type: .nonNull(.scalar(String.self))),
        GraphQLField("isFinished", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("taskDate", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String, subId: String, task: String, isFinished: Bool, taskDate: Int) {
        self.init(snapshot: ["__typename": "Todo", "id": id, "subId": subId, "task": task, "isFinished": isFinished, "taskDate": taskDate])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return snapshot["id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var subId: String {
        get {
          return snapshot["subId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "subId")
        }
      }

      public var task: String {
        get {
          return snapshot["task"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "task")
        }
      }

      public var isFinished: Bool {
        get {
          return snapshot["isFinished"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isFinished")
        }
      }

      public var taskDate: Int {
        get {
          return snapshot["taskDate"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "taskDate")
        }
      }
    }
  }
}

public final class OnDeleteTodoSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteTodo($subId: String) {\n  onDeleteTodo(subId: $subId) {\n    __typename\n    id\n    subId\n    task\n    isFinished\n    taskDate\n  }\n}"

  public var subId: String?

  public init(subId: String? = nil) {
    self.subId = subId
  }

  public var variables: GraphQLMap? {
    return ["subId": subId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteTodo", arguments: ["subId": GraphQLVariable("subId")], type: .object(OnDeleteTodo.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteTodo: OnDeleteTodo? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteTodo": onDeleteTodo.flatMap { $0.snapshot }])
    }

    public var onDeleteTodo: OnDeleteTodo? {
      get {
        return (snapshot["onDeleteTodo"] as? Snapshot).flatMap { OnDeleteTodo(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteTodo")
      }
    }

    public struct OnDeleteTodo: GraphQLSelectionSet {
      public static let possibleTypes = ["Todo"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(String.self))),
        GraphQLField("subId", type: .nonNull(.scalar(String.self))),
        GraphQLField("task", type: .nonNull(.scalar(String.self))),
        GraphQLField("isFinished", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("taskDate", type: .nonNull(.scalar(Int.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: String, subId: String, task: String, isFinished: Bool, taskDate: Int) {
        self.init(snapshot: ["__typename": "Todo", "id": id, "subId": subId, "task": task, "isFinished": isFinished, "taskDate": taskDate])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return snapshot["id"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var subId: String {
        get {
          return snapshot["subId"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "subId")
        }
      }

      public var task: String {
        get {
          return snapshot["task"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "task")
        }
      }

      public var isFinished: Bool {
        get {
          return snapshot["isFinished"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "isFinished")
        }
      }

      public var taskDate: Int {
        get {
          return snapshot["taskDate"]! as! Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "taskDate")
        }
      }
    }
  }
}