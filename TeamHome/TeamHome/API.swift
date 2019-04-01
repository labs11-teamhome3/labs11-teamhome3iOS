//  This file was automatically generated and should not be edited.

import Apollo

public final class TodoListsQuery: GraphQLQuery {
  public let operationDefinition =
    "query TodoLists {\n  todoLists {\n    __typename\n    id\n    description\n    ownedBy {\n      __typename\n      id\n      name\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("todoLists", type: .nonNull(.list(.object(TodoList.selections)))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(todoLists: [TodoList?]) {
      self.init(unsafeResultMap: ["__typename": "Query", "todoLists": todoLists.map { (value: TodoList?) -> ResultMap? in value.flatMap { (value: TodoList) -> ResultMap in value.resultMap } }])
    }

    public var todoLists: [TodoList?] {
      get {
        return (resultMap["todoLists"] as! [ResultMap?]).map { (value: ResultMap?) -> TodoList? in value.flatMap { (value: ResultMap) -> TodoList in TodoList(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: TodoList?) -> ResultMap? in value.flatMap { (value: TodoList) -> ResultMap in value.resultMap } }, forKey: "todoLists")
      }
    }

    public struct TodoList: GraphQLSelectionSet {
      public static let possibleTypes = ["TodoList"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("description", type: .nonNull(.scalar(String.self))),
        GraphQLField("ownedBy", type: .list(.nonNull(.object(OwnedBy.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, description: String, ownedBy: [OwnedBy]? = nil) {
        self.init(unsafeResultMap: ["__typename": "TodoList", "id": id, "description": description, "ownedBy": ownedBy.flatMap { (value: [OwnedBy]) -> [ResultMap] in value.map { (value: OwnedBy) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var description: String {
        get {
          return resultMap["description"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var ownedBy: [OwnedBy]? {
        get {
          return (resultMap["ownedBy"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [OwnedBy] in value.map { (value: ResultMap) -> OwnedBy in OwnedBy(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [OwnedBy]) -> [ResultMap] in value.map { (value: OwnedBy) -> ResultMap in value.resultMap } }, forKey: "ownedBy")
        }
      }

      public struct OwnedBy: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}