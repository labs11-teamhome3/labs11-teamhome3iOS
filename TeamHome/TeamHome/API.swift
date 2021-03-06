//  This file was automatically generated and should not be edited.

import Apollo

public enum Role: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case admin
  case general
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ADMIN": self = .admin
      case "GENERAL": self = .general
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .admin: return "ADMIN"
      case .general: return "GENERAL"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Role, rhs: Role) -> Bool {
    switch (lhs, rhs) {
      case (.admin, .admin): return true
      case (.general, .general): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public final class FindMessageByIdQuery: GraphQLQuery {
  public let operationDefinition =
    "query FindMessageById($id: ID!) {\n  message(id: $id) {\n    __typename\n    id\n    createdAt\n    title\n    creator {\n      __typename\n      name\n      profilePic\n    }\n    inTeam {\n      __typename\n      teamName\n      id\n    }\n    content\n    images\n    tag {\n      __typename\n      name\n      id\n    }\n    comments {\n      __typename\n      id\n      content\n    }\n    subscribedUsers {\n      __typename\n      name\n      profilePic\n      id\n    }\n    createdAt\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("message", arguments: ["id": GraphQLVariable("id")], type: .object(Message.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(message: Message? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "message": message.flatMap { (value: Message) -> ResultMap in value.resultMap }])
    }

    public var message: Message? {
      get {
        return (resultMap["message"] as? ResultMap).flatMap { Message(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "message")
      }
    }

    public struct Message: GraphQLSelectionSet {
      public static let possibleTypes = ["Message"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("creator", type: .nonNull(.object(Creator.selections))),
        GraphQLField("inTeam", type: .nonNull(.object(InTeam.selections))),
        GraphQLField("content", type: .nonNull(.scalar(String.self))),
        GraphQLField("images", type: .list(.scalar(String.self))),
        GraphQLField("tag", type: .object(Tag.selections)),
        GraphQLField("comments", type: .list(.object(Comment.selections))),
        GraphQLField("subscribedUsers", type: .list(.object(SubscribedUser.selections))),
        GraphQLField("createdAt", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, createdAt: String? = nil, title: String, creator: Creator, inTeam: InTeam, content: String, images: [String?]? = nil, tag: Tag? = nil, comments: [Comment?]? = nil, subscribedUsers: [SubscribedUser?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Message", "id": id, "createdAt": createdAt, "title": title, "creator": creator.resultMap, "inTeam": inTeam.resultMap, "content": content, "images": images, "tag": tag.flatMap { (value: Tag) -> ResultMap in value.resultMap }, "comments": comments.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }, "subscribedUsers": subscribedUsers.flatMap { (value: [SubscribedUser?]) -> [ResultMap?] in value.map { (value: SubscribedUser?) -> ResultMap? in value.flatMap { (value: SubscribedUser) -> ResultMap in value.resultMap } } }])
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

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var creator: Creator {
        get {
          return Creator(unsafeResultMap: resultMap["creator"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "creator")
        }
      }

      public var inTeam: InTeam {
        get {
          return InTeam(unsafeResultMap: resultMap["inTeam"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "inTeam")
        }
      }

      public var content: String {
        get {
          return resultMap["content"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "content")
        }
      }

      public var images: [String?]? {
        get {
          return resultMap["images"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "images")
        }
      }

      public var tag: Tag? {
        get {
          return (resultMap["tag"] as? ResultMap).flatMap { Tag(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "tag")
        }
      }

      public var comments: [Comment?]? {
        get {
          return (resultMap["comments"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Comment?] in value.map { (value: ResultMap?) -> Comment? in value.flatMap { (value: ResultMap) -> Comment in Comment(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }, forKey: "comments")
        }
      }

      public var subscribedUsers: [SubscribedUser?]? {
        get {
          return (resultMap["subscribedUsers"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SubscribedUser?] in value.map { (value: ResultMap?) -> SubscribedUser? in value.flatMap { (value: ResultMap) -> SubscribedUser in SubscribedUser(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [SubscribedUser?]) -> [ResultMap?] in value.map { (value: SubscribedUser?) -> ResultMap? in value.flatMap { (value: SubscribedUser) -> ResultMap in value.resultMap } } }, forKey: "subscribedUsers")
        }
      }

      public struct Creator: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("profilePic", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, profilePic: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "name": name, "profilePic": profilePic])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var profilePic: String? {
          get {
            return resultMap["profilePic"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profilePic")
          }
        }
      }

      public struct InTeam: GraphQLSelectionSet {
        public static let possibleTypes = ["Team"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("teamName", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(teamName: String, id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Team", "teamName": teamName, "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var teamName: String {
          get {
            return resultMap["teamName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "teamName")
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
      }

      public struct Tag: GraphQLSelectionSet {
        public static let possibleTypes = ["Tag"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Tag", "name": name, "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }

      public struct Comment: GraphQLSelectionSet {
        public static let possibleTypes = ["MessageComment"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, content: String) {
          self.init(unsafeResultMap: ["__typename": "MessageComment", "id": id, "content": content])
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

        public var content: String {
          get {
            return resultMap["content"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "content")
          }
        }
      }

      public struct SubscribedUser: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("profilePic", type: .scalar(String.self)),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, profilePic: String? = nil, id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "User", "name": name, "profilePic": profilePic, "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var profilePic: String? {
          get {
            return resultMap["profilePic"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profilePic")
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
      }
    }
  }
}

public final class CreateImageCommentMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation CreateImageComment($messageId: ID!, $userId: ID!, $content: String!, $image: String) {\n  addMessageComment(messageId: $messageId, userId: $userId, content: $content, image: $image) {\n    __typename\n    id\n  }\n}"

  public var messageId: GraphQLID
  public var userId: GraphQLID
  public var content: String
  public var image: String?

  public init(messageId: GraphQLID, userId: GraphQLID, content: String, image: String? = nil) {
    self.messageId = messageId
    self.userId = userId
    self.content = content
    self.image = image
  }

  public var variables: GraphQLMap? {
    return ["messageId": messageId, "userId": userId, "content": content, "image": image]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("addMessageComment", arguments: ["messageId": GraphQLVariable("messageId"), "userId": GraphQLVariable("userId"), "content": GraphQLVariable("content"), "image": GraphQLVariable("image")], type: .object(AddMessageComment.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addMessageComment: AddMessageComment? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addMessageComment": addMessageComment.flatMap { (value: AddMessageComment) -> ResultMap in value.resultMap }])
    }

    public var addMessageComment: AddMessageComment? {
      get {
        return (resultMap["addMessageComment"] as? ResultMap).flatMap { AddMessageComment(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "addMessageComment")
      }
    }

    public struct AddMessageComment: GraphQLSelectionSet {
      public static let possibleTypes = ["MessageComment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "MessageComment", "id": id])
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
    }
  }
}

public final class CreateCommentMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation CreateComment($messageId: ID!, $userId: ID!, $content: String!) {\n  addMessageComment(messageId: $messageId, userId: $userId, content: $content) {\n    __typename\n    id\n  }\n}"

  public var messageId: GraphQLID
  public var userId: GraphQLID
  public var content: String

  public init(messageId: GraphQLID, userId: GraphQLID, content: String) {
    self.messageId = messageId
    self.userId = userId
    self.content = content
  }

  public var variables: GraphQLMap? {
    return ["messageId": messageId, "userId": userId, "content": content]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("addMessageComment", arguments: ["messageId": GraphQLVariable("messageId"), "userId": GraphQLVariable("userId"), "content": GraphQLVariable("content")], type: .object(AddMessageComment.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addMessageComment: AddMessageComment? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addMessageComment": addMessageComment.flatMap { (value: AddMessageComment) -> ResultMap in value.resultMap }])
    }

    public var addMessageComment: AddMessageComment? {
      get {
        return (resultMap["addMessageComment"] as? ResultMap).flatMap { AddMessageComment(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "addMessageComment")
      }
    }

    public struct AddMessageComment: GraphQLSelectionSet {
      public static let possibleTypes = ["MessageComment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "MessageComment", "id": id])
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
    }
  }
}

public final class CreateNewUserMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation CreateNewUser($name: String!, $email: String!) {\n  createUser(name: $name, email: $email) {\n    __typename\n    id\n  }\n}"

  public var name: String
  public var email: String

  public init(name: String, email: String) {
    self.name = name
    self.email = email
  }

  public var variables: GraphQLMap? {
    return ["name": name, "email": email]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createUser", arguments: ["name": GraphQLVariable("name"), "email": GraphQLVariable("email")], type: .nonNull(.object(CreateUser.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createUser: CreateUser) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createUser": createUser.resultMap])
    }

    public var createUser: CreateUser {
      get {
        return CreateUser(unsafeResultMap: resultMap["createUser"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createUser")
      }
    }

    public struct CreateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id])
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
    }
  }
}

public final class FetchAllTodoListQuery: GraphQLQuery {
  public let operationDefinition =
    "query FetchAllTodoList {\n  todoLists {\n    __typename\n    id\n    createdAt\n    description\n    completed\n    todos {\n      __typename\n      id\n      createdAt\n      description\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("todoLists", type: .list(.object(TodoList.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(todoLists: [TodoList?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "todoLists": todoLists.flatMap { (value: [TodoList?]) -> [ResultMap?] in value.map { (value: TodoList?) -> ResultMap? in value.flatMap { (value: TodoList) -> ResultMap in value.resultMap } } }])
    }

    public var todoLists: [TodoList?]? {
      get {
        return (resultMap["todoLists"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [TodoList?] in value.map { (value: ResultMap?) -> TodoList? in value.flatMap { (value: ResultMap) -> TodoList in TodoList(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [TodoList?]) -> [ResultMap?] in value.map { (value: TodoList?) -> ResultMap? in value.flatMap { (value: TodoList) -> ResultMap in value.resultMap } } }, forKey: "todoLists")
      }
    }

    public struct TodoList: GraphQLSelectionSet {
      public static let possibleTypes = ["TodoList"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("description", type: .nonNull(.scalar(String.self))),
        GraphQLField("completed", type: .scalar(Bool.self)),
        GraphQLField("todos", type: .nonNull(.list(.nonNull(.object(Todo.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, createdAt: String? = nil, description: String, completed: Bool? = nil, todos: [Todo]) {
        self.init(unsafeResultMap: ["__typename": "TodoList", "id": id, "createdAt": createdAt, "description": description, "completed": completed, "todos": todos.map { (value: Todo) -> ResultMap in value.resultMap }])
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

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
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

      public var completed: Bool? {
        get {
          return resultMap["completed"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "completed")
        }
      }

      public var todos: [Todo] {
        get {
          return (resultMap["todos"] as! [ResultMap]).map { (value: ResultMap) -> Todo in Todo(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Todo) -> ResultMap in value.resultMap }, forKey: "todos")
        }
      }

      public struct Todo: GraphQLSelectionSet {
        public static let possibleTypes = ["Todo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, createdAt: String? = nil, description: String) {
          self.init(unsafeResultMap: ["__typename": "Todo", "id": id, "createdAt": createdAt, "description": description])
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

        public var createdAt: String? {
          get {
            return resultMap["createdAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
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
      }
    }
  }
}

public final class OtherFetchAllTodoListQuery: GraphQLQuery {
  public let operationDefinition =
    "query OtherFetchAllTodoList($teamId: ID) {\n  todoLists(teamId: $teamId) {\n    __typename\n    id\n    createdAt\n    description\n    completed\n    todos {\n      __typename\n      id\n      createdAt\n      description\n      completed\n    }\n  }\n}"

  public var teamId: GraphQLID?

  public init(teamId: GraphQLID? = nil) {
    self.teamId = teamId
  }

  public var variables: GraphQLMap? {
    return ["teamId": teamId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("todoLists", arguments: ["teamId": GraphQLVariable("teamId")], type: .list(.object(TodoList.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(todoLists: [TodoList?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "todoLists": todoLists.flatMap { (value: [TodoList?]) -> [ResultMap?] in value.map { (value: TodoList?) -> ResultMap? in value.flatMap { (value: TodoList) -> ResultMap in value.resultMap } } }])
    }

    public var todoLists: [TodoList?]? {
      get {
        return (resultMap["todoLists"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [TodoList?] in value.map { (value: ResultMap?) -> TodoList? in value.flatMap { (value: ResultMap) -> TodoList in TodoList(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [TodoList?]) -> [ResultMap?] in value.map { (value: TodoList?) -> ResultMap? in value.flatMap { (value: TodoList) -> ResultMap in value.resultMap } } }, forKey: "todoLists")
      }
    }

    public struct TodoList: GraphQLSelectionSet {
      public static let possibleTypes = ["TodoList"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("description", type: .nonNull(.scalar(String.self))),
        GraphQLField("completed", type: .scalar(Bool.self)),
        GraphQLField("todos", type: .nonNull(.list(.nonNull(.object(Todo.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, createdAt: String? = nil, description: String, completed: Bool? = nil, todos: [Todo]) {
        self.init(unsafeResultMap: ["__typename": "TodoList", "id": id, "createdAt": createdAt, "description": description, "completed": completed, "todos": todos.map { (value: Todo) -> ResultMap in value.resultMap }])
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

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
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

      public var completed: Bool? {
        get {
          return resultMap["completed"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "completed")
        }
      }

      public var todos: [Todo] {
        get {
          return (resultMap["todos"] as! [ResultMap]).map { (value: ResultMap) -> Todo in Todo(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Todo) -> ResultMap in value.resultMap }, forKey: "todos")
        }
      }

      public struct Todo: GraphQLSelectionSet {
        public static let possibleTypes = ["Todo"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("completed", type: .scalar(Bool.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, createdAt: String? = nil, description: String, completed: Bool? = nil) {
          self.init(unsafeResultMap: ["__typename": "Todo", "id": id, "createdAt": createdAt, "description": description, "completed": completed])
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

        public var createdAt: String? {
          get {
            return resultMap["createdAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
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

        public var completed: Bool? {
          get {
            return resultMap["completed"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "completed")
          }
        }
      }
    }
  }
}

public final class UpdateTodoMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation UpdateTodo($id: String!, $description: String!, $completed: Boolean) {\n  updateTodo(id: $id, description: $description, completed: $completed) {\n    __typename\n    completed\n  }\n}"

  public var id: String
  public var description: String
  public var completed: Bool?

  public init(id: String, description: String, completed: Bool? = nil) {
    self.id = id
    self.description = description
    self.completed = completed
  }

  public var variables: GraphQLMap? {
    return ["id": id, "description": description, "completed": completed]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateTodo", arguments: ["id": GraphQLVariable("id"), "description": GraphQLVariable("description"), "completed": GraphQLVariable("completed")], type: .object(UpdateTodo.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateTodo: UpdateTodo? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateTodo": updateTodo.flatMap { (value: UpdateTodo) -> ResultMap in value.resultMap }])
    }

    public var updateTodo: UpdateTodo? {
      get {
        return (resultMap["updateTodo"] as? ResultMap).flatMap { UpdateTodo(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateTodo")
      }
    }

    public struct UpdateTodo: GraphQLSelectionSet {
      public static let possibleTypes = ["Todo"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("completed", type: .scalar(Bool.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(completed: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "Todo", "completed": completed])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var completed: Bool? {
        get {
          return resultMap["completed"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "completed")
        }
      }
    }
  }
}

public final class CreateTodoMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation CreateTodo($partOf: ID!, $description: String!, $completed: Boolean) {\n  createTodo(partOf: $partOf, description: $description, completed: $completed) {\n    __typename\n    description\n    completed\n  }\n}"

  public var partOf: GraphQLID
  public var description: String
  public var completed: Bool?

  public init(partOf: GraphQLID, description: String, completed: Bool? = nil) {
    self.partOf = partOf
    self.description = description
    self.completed = completed
  }

  public var variables: GraphQLMap? {
    return ["partOf": partOf, "description": description, "completed": completed]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createTodo", arguments: ["partOf": GraphQLVariable("partOf"), "description": GraphQLVariable("description"), "completed": GraphQLVariable("completed")], type: .object(CreateTodo.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createTodo: CreateTodo? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createTodo": createTodo.flatMap { (value: CreateTodo) -> ResultMap in value.resultMap }])
    }

    public var createTodo: CreateTodo? {
      get {
        return (resultMap["createTodo"] as? ResultMap).flatMap { CreateTodo(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createTodo")
      }
    }

    public struct CreateTodo: GraphQLSelectionSet {
      public static let possibleTypes = ["Todo"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("description", type: .nonNull(.scalar(String.self))),
        GraphQLField("completed", type: .scalar(Bool.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(description: String, completed: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "Todo", "description": description, "completed": completed])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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

      public var completed: Bool? {
        get {
          return resultMap["completed"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "completed")
        }
      }
    }
  }
}

public final class FindDocumentsByTeamQuery: GraphQLQuery {
  public let operationDefinition =
    "query FindDocumentsByTeam($teamID: ID) {\n  findDocumentsByTeam(teamId: $teamID) {\n    __typename\n    id\n    doc_url\n    user {\n      __typename\n      name\n      profilePic\n      id\n    }\n    folder {\n      __typename\n      id\n      title\n    }\n    title\n    textContent\n    tag {\n      __typename\n      id\n      name\n      team {\n        __typename\n        id\n      }\n    }\n    images\n    comments {\n      __typename\n      id\n    }\n    subscribedUsers {\n      __typename\n      name\n      profilePic\n    }\n    createdAt\n  }\n}"

  public var teamID: GraphQLID?

  public init(teamID: GraphQLID? = nil) {
    self.teamID = teamID
  }

  public var variables: GraphQLMap? {
    return ["teamID": teamID]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("findDocumentsByTeam", arguments: ["teamId": GraphQLVariable("teamID")], type: .list(.object(FindDocumentsByTeam.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(findDocumentsByTeam: [FindDocumentsByTeam?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "findDocumentsByTeam": findDocumentsByTeam.flatMap { (value: [FindDocumentsByTeam?]) -> [ResultMap?] in value.map { (value: FindDocumentsByTeam?) -> ResultMap? in value.flatMap { (value: FindDocumentsByTeam) -> ResultMap in value.resultMap } } }])
    }

    public var findDocumentsByTeam: [FindDocumentsByTeam?]? {
      get {
        return (resultMap["findDocumentsByTeam"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [FindDocumentsByTeam?] in value.map { (value: ResultMap?) -> FindDocumentsByTeam? in value.flatMap { (value: ResultMap) -> FindDocumentsByTeam in FindDocumentsByTeam(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [FindDocumentsByTeam?]) -> [ResultMap?] in value.map { (value: FindDocumentsByTeam?) -> ResultMap? in value.flatMap { (value: FindDocumentsByTeam) -> ResultMap in value.resultMap } } }, forKey: "findDocumentsByTeam")
      }
    }

    public struct FindDocumentsByTeam: GraphQLSelectionSet {
      public static let possibleTypes = ["Document"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("doc_url", type: .nonNull(.scalar(String.self))),
        GraphQLField("user", type: .nonNull(.object(User.selections))),
        GraphQLField("folder", type: .object(Folder.selections)),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("textContent", type: .nonNull(.scalar(String.self))),
        GraphQLField("tag", type: .object(Tag.selections)),
        GraphQLField("images", type: .list(.scalar(String.self))),
        GraphQLField("comments", type: .list(.object(Comment.selections))),
        GraphQLField("subscribedUsers", type: .list(.object(SubscribedUser.selections))),
        GraphQLField("createdAt", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, docUrl: String, user: User, folder: Folder? = nil, title: String, textContent: String, tag: Tag? = nil, images: [String?]? = nil, comments: [Comment?]? = nil, subscribedUsers: [SubscribedUser?]? = nil, createdAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Document", "id": id, "doc_url": docUrl, "user": user.resultMap, "folder": folder.flatMap { (value: Folder) -> ResultMap in value.resultMap }, "title": title, "textContent": textContent, "tag": tag.flatMap { (value: Tag) -> ResultMap in value.resultMap }, "images": images, "comments": comments.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }, "subscribedUsers": subscribedUsers.flatMap { (value: [SubscribedUser?]) -> [ResultMap?] in value.map { (value: SubscribedUser?) -> ResultMap? in value.flatMap { (value: SubscribedUser) -> ResultMap in value.resultMap } } }, "createdAt": createdAt])
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

      public var docUrl: String {
        get {
          return resultMap["doc_url"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "doc_url")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public var folder: Folder? {
        get {
          return (resultMap["folder"] as? ResultMap).flatMap { Folder(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "folder")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var textContent: String {
        get {
          return resultMap["textContent"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "textContent")
        }
      }

      public var tag: Tag? {
        get {
          return (resultMap["tag"] as? ResultMap).flatMap { Tag(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "tag")
        }
      }

      public var images: [String?]? {
        get {
          return resultMap["images"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "images")
        }
      }

      public var comments: [Comment?]? {
        get {
          return (resultMap["comments"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Comment?] in value.map { (value: ResultMap?) -> Comment? in value.flatMap { (value: ResultMap) -> Comment in Comment(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }, forKey: "comments")
        }
      }

      public var subscribedUsers: [SubscribedUser?]? {
        get {
          return (resultMap["subscribedUsers"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SubscribedUser?] in value.map { (value: ResultMap?) -> SubscribedUser? in value.flatMap { (value: ResultMap) -> SubscribedUser in SubscribedUser(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [SubscribedUser?]) -> [ResultMap?] in value.map { (value: SubscribedUser?) -> ResultMap? in value.flatMap { (value: SubscribedUser) -> ResultMap in value.resultMap } } }, forKey: "subscribedUsers")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("profilePic", type: .scalar(String.self)),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, profilePic: String? = nil, id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "User", "name": name, "profilePic": profilePic, "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var profilePic: String? {
          get {
            return resultMap["profilePic"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profilePic")
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
      }

      public struct Folder: GraphQLSelectionSet {
        public static let possibleTypes = ["Folder"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, title: String) {
          self.init(unsafeResultMap: ["__typename": "Folder", "id": id, "title": title])
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

        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }
      }

      public struct Tag: GraphQLSelectionSet {
        public static let possibleTypes = ["Tag"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("team", type: .object(Team.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String, team: Team? = nil) {
          self.init(unsafeResultMap: ["__typename": "Tag", "id": id, "name": name, "team": team.flatMap { (value: Team) -> ResultMap in value.resultMap }])
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

        public var team: Team? {
          get {
            return (resultMap["team"] as? ResultMap).flatMap { Team(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "team")
          }
        }

        public struct Team: GraphQLSelectionSet {
          public static let possibleTypes = ["Team"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID) {
            self.init(unsafeResultMap: ["__typename": "Team", "id": id])
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
        }
      }

      public struct Comment: GraphQLSelectionSet {
        public static let possibleTypes = ["DocumentComment"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "DocumentComment", "id": id])
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
      }

      public struct SubscribedUser: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("profilePic", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, profilePic: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "name": name, "profilePic": profilePic])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var profilePic: String? {
          get {
            return resultMap["profilePic"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profilePic")
          }
        }
      }
    }
  }
}

public final class FindFoldersByTeamQuery: GraphQLQuery {
  public let operationDefinition =
    "query FindFoldersByTeam($teamID: ID!) {\n  findFoldersByTeam(teamId: $teamID) {\n    __typename\n    id\n    user {\n      __typename\n      name\n      profilePic\n      id\n    }\n    title\n    createdAt\n  }\n}"

  public var teamID: GraphQLID

  public init(teamID: GraphQLID) {
    self.teamID = teamID
  }

  public var variables: GraphQLMap? {
    return ["teamID": teamID]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("findFoldersByTeam", arguments: ["teamId": GraphQLVariable("teamID")], type: .list(.object(FindFoldersByTeam.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(findFoldersByTeam: [FindFoldersByTeam?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "findFoldersByTeam": findFoldersByTeam.flatMap { (value: [FindFoldersByTeam?]) -> [ResultMap?] in value.map { (value: FindFoldersByTeam?) -> ResultMap? in value.flatMap { (value: FindFoldersByTeam) -> ResultMap in value.resultMap } } }])
    }

    public var findFoldersByTeam: [FindFoldersByTeam?]? {
      get {
        return (resultMap["findFoldersByTeam"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [FindFoldersByTeam?] in value.map { (value: ResultMap?) -> FindFoldersByTeam? in value.flatMap { (value: ResultMap) -> FindFoldersByTeam in FindFoldersByTeam(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [FindFoldersByTeam?]) -> [ResultMap?] in value.map { (value: FindFoldersByTeam?) -> ResultMap? in value.flatMap { (value: FindFoldersByTeam) -> ResultMap in value.resultMap } } }, forKey: "findFoldersByTeam")
      }
    }

    public struct FindFoldersByTeam: GraphQLSelectionSet {
      public static let possibleTypes = ["Folder"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("user", type: .nonNull(.object(User.selections))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, user: User, title: String, createdAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Folder", "id": id, "user": user.resultMap, "title": title, "createdAt": createdAt])
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

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("profilePic", type: .scalar(String.self)),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, profilePic: String? = nil, id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "User", "name": name, "profilePic": profilePic, "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var profilePic: String? {
          get {
            return resultMap["profilePic"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profilePic")
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
      }
    }
  }
}

public final class DeleteDocumentMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation DeleteDocument($docID: ID!) {\n  deleteDocument(documentId: $docID) {\n    __typename\n    id\n    title\n  }\n}"

  public var docID: GraphQLID

  public init(docID: GraphQLID) {
    self.docID = docID
  }

  public var variables: GraphQLMap? {
    return ["docID": docID]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteDocument", arguments: ["documentId": GraphQLVariable("docID")], type: .object(DeleteDocument.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteDocument: DeleteDocument? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteDocument": deleteDocument.flatMap { (value: DeleteDocument) -> ResultMap in value.resultMap }])
    }

    public var deleteDocument: DeleteDocument? {
      get {
        return (resultMap["deleteDocument"] as? ResultMap).flatMap { DeleteDocument(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "deleteDocument")
      }
    }

    public struct DeleteDocument: GraphQLSelectionSet {
      public static let possibleTypes = ["Document"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String) {
        self.init(unsafeResultMap: ["__typename": "Document", "id": id, "title": title])
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

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }
    }
  }
}

public final class AddNewFolderMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation AddNewFolder($title: String!, $userId: ID!, $teamId: ID!) {\n  createFolder(title: $title, userId: $userId, teamId: $teamId) {\n    __typename\n    id\n    title\n  }\n}"

  public var title: String
  public var userId: GraphQLID
  public var teamId: GraphQLID

  public init(title: String, userId: GraphQLID, teamId: GraphQLID) {
    self.title = title
    self.userId = userId
    self.teamId = teamId
  }

  public var variables: GraphQLMap? {
    return ["title": title, "userId": userId, "teamId": teamId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createFolder", arguments: ["title": GraphQLVariable("title"), "userId": GraphQLVariable("userId"), "teamId": GraphQLVariable("teamId")], type: .object(CreateFolder.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createFolder: CreateFolder? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createFolder": createFolder.flatMap { (value: CreateFolder) -> ResultMap in value.resultMap }])
    }

    public var createFolder: CreateFolder? {
      get {
        return (resultMap["createFolder"] as? ResultMap).flatMap { CreateFolder(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createFolder")
      }
    }

    public struct CreateFolder: GraphQLSelectionSet {
      public static let possibleTypes = ["Folder"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String) {
        self.init(unsafeResultMap: ["__typename": "Folder", "id": id, "title": title])
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

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }
    }
  }
}

public final class FindTeamByIdQuery: GraphQLQuery {
  public let operationDefinition =
    "query FindTeamById($id: ID!) {\n  team(id: $id) {\n    __typename\n    id\n    teamName\n    members {\n      __typename\n      id\n      name\n      email\n      phone\n      profilePic\n      role\n    }\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("team", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(Team.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(team: Team) {
      self.init(unsafeResultMap: ["__typename": "Query", "team": team.resultMap])
    }

    public var team: Team {
      get {
        return Team(unsafeResultMap: resultMap["team"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "team")
      }
    }

    public struct Team: GraphQLSelectionSet {
      public static let possibleTypes = ["Team"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("teamName", type: .nonNull(.scalar(String.self))),
        GraphQLField("members", type: .list(.nonNull(.object(Member.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, teamName: String, members: [Member]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Team", "id": id, "teamName": teamName, "members": members.flatMap { (value: [Member]) -> [ResultMap] in value.map { (value: Member) -> ResultMap in value.resultMap } }])
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

      public var teamName: String {
        get {
          return resultMap["teamName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "teamName")
        }
      }

      public var members: [Member]? {
        get {
          return (resultMap["members"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Member] in value.map { (value: ResultMap) -> Member in Member(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Member]) -> [ResultMap] in value.map { (value: Member) -> ResultMap in value.resultMap } }, forKey: "members")
        }
      }

      public struct Member: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("phone", type: .scalar(String.self)),
          GraphQLField("profilePic", type: .scalar(String.self)),
          GraphQLField("role", type: .scalar(Role.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, email: String? = nil, phone: String? = nil, profilePic: String? = nil, role: Role? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "email": email, "phone": phone, "profilePic": profilePic, "role": role])
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

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var email: String? {
          get {
            return resultMap["email"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        public var phone: String? {
          get {
            return resultMap["phone"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "phone")
          }
        }

        public var profilePic: String? {
          get {
            return resultMap["profilePic"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profilePic")
          }
        }

        public var role: Role? {
          get {
            return resultMap["role"] as? Role
          }
          set {
            resultMap.updateValue(newValue, forKey: "role")
          }
        }
      }
    }
  }
}

public final class KickUserMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation kickUser($teamId: ID!, $userId: ID!) {\n  removeUserFromTeam(userId: $userId, teamId: $teamId) {\n    __typename\n    id\n  }\n}"

  public var teamId: GraphQLID
  public var userId: GraphQLID

  public init(teamId: GraphQLID, userId: GraphQLID) {
    self.teamId = teamId
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["teamId": teamId, "userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("removeUserFromTeam", arguments: ["userId": GraphQLVariable("userId"), "teamId": GraphQLVariable("teamId")], type: .object(RemoveUserFromTeam.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(removeUserFromTeam: RemoveUserFromTeam? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "removeUserFromTeam": removeUserFromTeam.flatMap { (value: RemoveUserFromTeam) -> ResultMap in value.resultMap }])
    }

    public var removeUserFromTeam: RemoveUserFromTeam? {
      get {
        return (resultMap["removeUserFromTeam"] as? ResultMap).flatMap { RemoveUserFromTeam(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "removeUserFromTeam")
      }
    }

    public struct RemoveUserFromTeam: GraphQLSelectionSet {
      public static let possibleTypes = ["Team"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Team", "id": id])
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
    }
  }
}

public final class CurrentUserQuery: GraphQLQuery {
  public let operationDefinition =
    "query CurrentUser($authId: String) {\n  user(authId: $authId) {\n    __typename\n    id\n    createdAt\n    authId\n    name\n    todoListsOwned {\n      __typename\n      id\n      description\n      todos {\n        __typename\n        id\n        createdAt\n        description\n        completed\n      }\n    }\n    todoListsAssigned {\n      __typename\n      description\n    }\n    inTeam {\n      __typename\n      id\n      teamName\n    }\n    role\n    email\n    phone\n    profilePic\n  }\n}"

  public var authId: String?

  public init(authId: String? = nil) {
    self.authId = authId
  }

  public var variables: GraphQLMap? {
    return ["authId": authId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("user", arguments: ["authId": GraphQLVariable("authId")], type: .nonNull(.object(User.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: User) {
      self.init(unsafeResultMap: ["__typename": "Query", "user": user.resultMap])
    }

    public var user: User {
      get {
        return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("authId", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("todoListsOwned", type: .list(.object(TodoListsOwned.selections))),
        GraphQLField("todoListsAssigned", type: .list(.object(TodoListsAssigned.selections))),
        GraphQLField("inTeam", type: .list(.object(InTeam.selections))),
        GraphQLField("role", type: .scalar(Role.self)),
        GraphQLField("email", type: .scalar(String.self)),
        GraphQLField("phone", type: .scalar(String.self)),
        GraphQLField("profilePic", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, createdAt: String? = nil, authId: String? = nil, name: String? = nil, todoListsOwned: [TodoListsOwned?]? = nil, todoListsAssigned: [TodoListsAssigned?]? = nil, inTeam: [InTeam?]? = nil, role: Role? = nil, email: String? = nil, phone: String? = nil, profilePic: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "createdAt": createdAt, "authId": authId, "name": name, "todoListsOwned": todoListsOwned.flatMap { (value: [TodoListsOwned?]) -> [ResultMap?] in value.map { (value: TodoListsOwned?) -> ResultMap? in value.flatMap { (value: TodoListsOwned) -> ResultMap in value.resultMap } } }, "todoListsAssigned": todoListsAssigned.flatMap { (value: [TodoListsAssigned?]) -> [ResultMap?] in value.map { (value: TodoListsAssigned?) -> ResultMap? in value.flatMap { (value: TodoListsAssigned) -> ResultMap in value.resultMap } } }, "inTeam": inTeam.flatMap { (value: [InTeam?]) -> [ResultMap?] in value.map { (value: InTeam?) -> ResultMap? in value.flatMap { (value: InTeam) -> ResultMap in value.resultMap } } }, "role": role, "email": email, "phone": phone, "profilePic": profilePic])
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

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var authId: String? {
        get {
          return resultMap["authId"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "authId")
        }
      }

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var todoListsOwned: [TodoListsOwned?]? {
        get {
          return (resultMap["todoListsOwned"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [TodoListsOwned?] in value.map { (value: ResultMap?) -> TodoListsOwned? in value.flatMap { (value: ResultMap) -> TodoListsOwned in TodoListsOwned(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [TodoListsOwned?]) -> [ResultMap?] in value.map { (value: TodoListsOwned?) -> ResultMap? in value.flatMap { (value: TodoListsOwned) -> ResultMap in value.resultMap } } }, forKey: "todoListsOwned")
        }
      }

      public var todoListsAssigned: [TodoListsAssigned?]? {
        get {
          return (resultMap["todoListsAssigned"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [TodoListsAssigned?] in value.map { (value: ResultMap?) -> TodoListsAssigned? in value.flatMap { (value: ResultMap) -> TodoListsAssigned in TodoListsAssigned(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [TodoListsAssigned?]) -> [ResultMap?] in value.map { (value: TodoListsAssigned?) -> ResultMap? in value.flatMap { (value: TodoListsAssigned) -> ResultMap in value.resultMap } } }, forKey: "todoListsAssigned")
        }
      }

      public var inTeam: [InTeam?]? {
        get {
          return (resultMap["inTeam"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [InTeam?] in value.map { (value: ResultMap?) -> InTeam? in value.flatMap { (value: ResultMap) -> InTeam in InTeam(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [InTeam?]) -> [ResultMap?] in value.map { (value: InTeam?) -> ResultMap? in value.flatMap { (value: InTeam) -> ResultMap in value.resultMap } } }, forKey: "inTeam")
        }
      }

      public var role: Role? {
        get {
          return resultMap["role"] as? Role
        }
        set {
          resultMap.updateValue(newValue, forKey: "role")
        }
      }

      public var email: String? {
        get {
          return resultMap["email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var phone: String? {
        get {
          return resultMap["phone"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "phone")
        }
      }

      public var profilePic: String? {
        get {
          return resultMap["profilePic"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "profilePic")
        }
      }

      public struct TodoListsOwned: GraphQLSelectionSet {
        public static let possibleTypes = ["TodoList"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("todos", type: .nonNull(.list(.nonNull(.object(Todo.selections))))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, description: String, todos: [Todo]) {
          self.init(unsafeResultMap: ["__typename": "TodoList", "id": id, "description": description, "todos": todos.map { (value: Todo) -> ResultMap in value.resultMap }])
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

        public var todos: [Todo] {
          get {
            return (resultMap["todos"] as! [ResultMap]).map { (value: ResultMap) -> Todo in Todo(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Todo) -> ResultMap in value.resultMap }, forKey: "todos")
          }
        }

        public struct Todo: GraphQLSelectionSet {
          public static let possibleTypes = ["Todo"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("createdAt", type: .scalar(String.self)),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("completed", type: .scalar(Bool.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, createdAt: String? = nil, description: String, completed: Bool? = nil) {
            self.init(unsafeResultMap: ["__typename": "Todo", "id": id, "createdAt": createdAt, "description": description, "completed": completed])
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

          public var createdAt: String? {
            get {
              return resultMap["createdAt"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
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

          public var completed: Bool? {
            get {
              return resultMap["completed"] as? Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "completed")
            }
          }
        }
      }

      public struct TodoListsAssigned: GraphQLSelectionSet {
        public static let possibleTypes = ["TodoList"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(description: String) {
          self.init(unsafeResultMap: ["__typename": "TodoList", "description": description])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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
      }

      public struct InTeam: GraphQLSelectionSet {
        public static let possibleTypes = ["Team"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("teamName", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, teamName: String) {
          self.init(unsafeResultMap: ["__typename": "Team", "id": id, "teamName": teamName])
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

        public var teamName: String {
          get {
            return resultMap["teamName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "teamName")
          }
        }
      }
    }
  }
}

public final class AddDocumentCommentMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation AddDocumentComment($userId: ID!, $documentId: ID!, $comment: String!) {\n  addDocumentComment(userId: $userId, documentId: $documentId, content: $comment) {\n    __typename\n    id\n    content\n  }\n}"

  public var userId: GraphQLID
  public var documentId: GraphQLID
  public var comment: String

  public init(userId: GraphQLID, documentId: GraphQLID, comment: String) {
    self.userId = userId
    self.documentId = documentId
    self.comment = comment
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "documentId": documentId, "comment": comment]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("addDocumentComment", arguments: ["userId": GraphQLVariable("userId"), "documentId": GraphQLVariable("documentId"), "content": GraphQLVariable("comment")], type: .object(AddDocumentComment.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addDocumentComment: AddDocumentComment? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addDocumentComment": addDocumentComment.flatMap { (value: AddDocumentComment) -> ResultMap in value.resultMap }])
    }

    public var addDocumentComment: AddDocumentComment? {
      get {
        return (resultMap["addDocumentComment"] as? ResultMap).flatMap { AddDocumentComment(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "addDocumentComment")
      }
    }

    public struct AddDocumentComment: GraphQLSelectionSet {
      public static let possibleTypes = ["DocumentComment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("content", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, content: String) {
        self.init(unsafeResultMap: ["__typename": "DocumentComment", "id": id, "content": content])
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

      public var content: String {
        get {
          return resultMap["content"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "content")
        }
      }
    }
  }
}

public final class FindDocumentInputQuery: GraphQLQuery {
  public let operationDefinition =
    "query FindDocumentInput($docId: ID!) {\n  findDocument(id: $docId) {\n    __typename\n    id\n    doc_url\n    user {\n      __typename\n      name\n      profilePic\n      id\n    }\n    folder {\n      __typename\n      id\n      title\n    }\n    title\n    textContent\n    tag {\n      __typename\n      id\n      name\n    }\n    images\n    comments {\n      __typename\n      id\n      content\n    }\n    subscribedUsers {\n      __typename\n      id\n      name\n      profilePic\n    }\n    createdAt\n  }\n}"

  public var docId: GraphQLID

  public init(docId: GraphQLID) {
    self.docId = docId
  }

  public var variables: GraphQLMap? {
    return ["docId": docId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("findDocument", arguments: ["id": GraphQLVariable("docId")], type: .object(FindDocument.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(findDocument: FindDocument? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "findDocument": findDocument.flatMap { (value: FindDocument) -> ResultMap in value.resultMap }])
    }

    public var findDocument: FindDocument? {
      get {
        return (resultMap["findDocument"] as? ResultMap).flatMap { FindDocument(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "findDocument")
      }
    }

    public struct FindDocument: GraphQLSelectionSet {
      public static let possibleTypes = ["Document"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("doc_url", type: .nonNull(.scalar(String.self))),
        GraphQLField("user", type: .nonNull(.object(User.selections))),
        GraphQLField("folder", type: .object(Folder.selections)),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("textContent", type: .nonNull(.scalar(String.self))),
        GraphQLField("tag", type: .object(Tag.selections)),
        GraphQLField("images", type: .list(.scalar(String.self))),
        GraphQLField("comments", type: .list(.object(Comment.selections))),
        GraphQLField("subscribedUsers", type: .list(.object(SubscribedUser.selections))),
        GraphQLField("createdAt", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, docUrl: String, user: User, folder: Folder? = nil, title: String, textContent: String, tag: Tag? = nil, images: [String?]? = nil, comments: [Comment?]? = nil, subscribedUsers: [SubscribedUser?]? = nil, createdAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Document", "id": id, "doc_url": docUrl, "user": user.resultMap, "folder": folder.flatMap { (value: Folder) -> ResultMap in value.resultMap }, "title": title, "textContent": textContent, "tag": tag.flatMap { (value: Tag) -> ResultMap in value.resultMap }, "images": images, "comments": comments.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }, "subscribedUsers": subscribedUsers.flatMap { (value: [SubscribedUser?]) -> [ResultMap?] in value.map { (value: SubscribedUser?) -> ResultMap? in value.flatMap { (value: SubscribedUser) -> ResultMap in value.resultMap } } }, "createdAt": createdAt])
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

      public var docUrl: String {
        get {
          return resultMap["doc_url"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "doc_url")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public var folder: Folder? {
        get {
          return (resultMap["folder"] as? ResultMap).flatMap { Folder(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "folder")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var textContent: String {
        get {
          return resultMap["textContent"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "textContent")
        }
      }

      public var tag: Tag? {
        get {
          return (resultMap["tag"] as? ResultMap).flatMap { Tag(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "tag")
        }
      }

      public var images: [String?]? {
        get {
          return resultMap["images"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "images")
        }
      }

      public var comments: [Comment?]? {
        get {
          return (resultMap["comments"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Comment?] in value.map { (value: ResultMap?) -> Comment? in value.flatMap { (value: ResultMap) -> Comment in Comment(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }, forKey: "comments")
        }
      }

      public var subscribedUsers: [SubscribedUser?]? {
        get {
          return (resultMap["subscribedUsers"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SubscribedUser?] in value.map { (value: ResultMap?) -> SubscribedUser? in value.flatMap { (value: ResultMap) -> SubscribedUser in SubscribedUser(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [SubscribedUser?]) -> [ResultMap?] in value.map { (value: SubscribedUser?) -> ResultMap? in value.flatMap { (value: SubscribedUser) -> ResultMap in value.resultMap } } }, forKey: "subscribedUsers")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("profilePic", type: .scalar(String.self)),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, profilePic: String? = nil, id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "User", "name": name, "profilePic": profilePic, "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var profilePic: String? {
          get {
            return resultMap["profilePic"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profilePic")
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
      }

      public struct Folder: GraphQLSelectionSet {
        public static let possibleTypes = ["Folder"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, title: String) {
          self.init(unsafeResultMap: ["__typename": "Folder", "id": id, "title": title])
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

        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }
      }

      public struct Tag: GraphQLSelectionSet {
        public static let possibleTypes = ["Tag"]

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
          self.init(unsafeResultMap: ["__typename": "Tag", "id": id, "name": name])
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

      public struct Comment: GraphQLSelectionSet {
        public static let possibleTypes = ["DocumentComment"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, content: String) {
          self.init(unsafeResultMap: ["__typename": "DocumentComment", "id": id, "content": content])
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

        public var content: String {
          get {
            return resultMap["content"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "content")
          }
        }
      }

      public struct SubscribedUser: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("profilePic", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil, profilePic: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "profilePic": profilePic])
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

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var profilePic: String? {
          get {
            return resultMap["profilePic"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profilePic")
          }
        }
      }
    }
  }
}

public final class FindMessagesByTeamQuery: GraphQLQuery {
  public let operationDefinition =
    "query FindMessagesByTeam($teamId: ID!) {\n  team(id: $teamId) {\n    __typename\n    id\n    teamName\n    members {\n      __typename\n      name\n      profilePic\n      id\n    }\n    messages {\n      __typename\n      content\n      title\n      images\n      id\n      tag {\n        __typename\n        name\n        id\n      }\n      creator {\n        __typename\n        id\n        profilePic\n        name\n      }\n      comments {\n        __typename\n        createdAt\n        id\n        content\n      }\n      subscribedUsers {\n        __typename\n        name\n        profilePic\n      }\n      createdAt\n    }\n    tags {\n      __typename\n      name\n      id\n    }\n  }\n}"

  public var teamId: GraphQLID

  public init(teamId: GraphQLID) {
    self.teamId = teamId
  }

  public var variables: GraphQLMap? {
    return ["teamId": teamId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("team", arguments: ["id": GraphQLVariable("teamId")], type: .nonNull(.object(Team.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(team: Team) {
      self.init(unsafeResultMap: ["__typename": "Query", "team": team.resultMap])
    }

    public var team: Team {
      get {
        return Team(unsafeResultMap: resultMap["team"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "team")
      }
    }

    public struct Team: GraphQLSelectionSet {
      public static let possibleTypes = ["Team"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("teamName", type: .nonNull(.scalar(String.self))),
        GraphQLField("members", type: .list(.nonNull(.object(Member.selections)))),
        GraphQLField("messages", type: .list(.nonNull(.object(Message.selections)))),
        GraphQLField("tags", type: .list(.object(Tag.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, teamName: String, members: [Member]? = nil, messages: [Message]? = nil, tags: [Tag?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Team", "id": id, "teamName": teamName, "members": members.flatMap { (value: [Member]) -> [ResultMap] in value.map { (value: Member) -> ResultMap in value.resultMap } }, "messages": messages.flatMap { (value: [Message]) -> [ResultMap] in value.map { (value: Message) -> ResultMap in value.resultMap } }, "tags": tags.flatMap { (value: [Tag?]) -> [ResultMap?] in value.map { (value: Tag?) -> ResultMap? in value.flatMap { (value: Tag) -> ResultMap in value.resultMap } } }])
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

      public var teamName: String {
        get {
          return resultMap["teamName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "teamName")
        }
      }

      public var members: [Member]? {
        get {
          return (resultMap["members"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Member] in value.map { (value: ResultMap) -> Member in Member(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Member]) -> [ResultMap] in value.map { (value: Member) -> ResultMap in value.resultMap } }, forKey: "members")
        }
      }

      public var messages: [Message]? {
        get {
          return (resultMap["messages"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Message] in value.map { (value: ResultMap) -> Message in Message(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Message]) -> [ResultMap] in value.map { (value: Message) -> ResultMap in value.resultMap } }, forKey: "messages")
        }
      }

      public var tags: [Tag?]? {
        get {
          return (resultMap["tags"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Tag?] in value.map { (value: ResultMap?) -> Tag? in value.flatMap { (value: ResultMap) -> Tag in Tag(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Tag?]) -> [ResultMap?] in value.map { (value: Tag?) -> ResultMap? in value.flatMap { (value: Tag) -> ResultMap in value.resultMap } } }, forKey: "tags")
        }
      }

      public struct Member: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("profilePic", type: .scalar(String.self)),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, profilePic: String? = nil, id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "User", "name": name, "profilePic": profilePic, "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var profilePic: String? {
          get {
            return resultMap["profilePic"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profilePic")
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
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes = ["Message"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("images", type: .list(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("tag", type: .object(Tag.selections)),
          GraphQLField("creator", type: .nonNull(.object(Creator.selections))),
          GraphQLField("comments", type: .list(.object(Comment.selections))),
          GraphQLField("subscribedUsers", type: .list(.object(SubscribedUser.selections))),
          GraphQLField("createdAt", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(content: String, title: String, images: [String?]? = nil, id: GraphQLID, tag: Tag? = nil, creator: Creator, comments: [Comment?]? = nil, subscribedUsers: [SubscribedUser?]? = nil, createdAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Message", "content": content, "title": title, "images": images, "id": id, "tag": tag.flatMap { (value: Tag) -> ResultMap in value.resultMap }, "creator": creator.resultMap, "comments": comments.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }, "subscribedUsers": subscribedUsers.flatMap { (value: [SubscribedUser?]) -> [ResultMap?] in value.map { (value: SubscribedUser?) -> ResultMap? in value.flatMap { (value: SubscribedUser) -> ResultMap in value.resultMap } } }, "createdAt": createdAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var content: String {
          get {
            return resultMap["content"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "content")
          }
        }

        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var images: [String?]? {
          get {
            return resultMap["images"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "images")
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

        public var tag: Tag? {
          get {
            return (resultMap["tag"] as? ResultMap).flatMap { Tag(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "tag")
          }
        }

        public var creator: Creator {
          get {
            return Creator(unsafeResultMap: resultMap["creator"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "creator")
          }
        }

        public var comments: [Comment?]? {
          get {
            return (resultMap["comments"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Comment?] in value.map { (value: ResultMap?) -> Comment? in value.flatMap { (value: ResultMap) -> Comment in Comment(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }, forKey: "comments")
          }
        }

        public var subscribedUsers: [SubscribedUser?]? {
          get {
            return (resultMap["subscribedUsers"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [SubscribedUser?] in value.map { (value: ResultMap?) -> SubscribedUser? in value.flatMap { (value: ResultMap) -> SubscribedUser in SubscribedUser(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [SubscribedUser?]) -> [ResultMap?] in value.map { (value: SubscribedUser?) -> ResultMap? in value.flatMap { (value: SubscribedUser) -> ResultMap in value.resultMap } } }, forKey: "subscribedUsers")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["createdAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        public struct Tag: GraphQLSelectionSet {
          public static let possibleTypes = ["Tag"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, id: GraphQLID) {
            self.init(unsafeResultMap: ["__typename": "Tag", "name": name, "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
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

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }

        public struct Creator: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("profilePic", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, profilePic: String? = nil, name: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "User", "id": id, "profilePic": profilePic, "name": name])
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

          public var profilePic: String? {
            get {
              return resultMap["profilePic"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profilePic")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }

        public struct Comment: GraphQLSelectionSet {
          public static let possibleTypes = ["MessageComment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("createdAt", type: .scalar(String.self)),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(createdAt: String? = nil, id: GraphQLID, content: String) {
            self.init(unsafeResultMap: ["__typename": "MessageComment", "createdAt": createdAt, "id": id, "content": content])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var createdAt: String? {
            get {
              return resultMap["createdAt"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
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

          public var content: String {
            get {
              return resultMap["content"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "content")
            }
          }
        }

        public struct SubscribedUser: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("profilePic", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String? = nil, profilePic: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "User", "name": name, "profilePic": profilePic])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var profilePic: String? {
            get {
              return resultMap["profilePic"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "profilePic")
            }
          }
        }
      }

      public struct Tag: GraphQLSelectionSet {
        public static let possibleTypes = ["Tag"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Tag", "name": name, "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}

public final class FindTagsByTeamQuery: GraphQLQuery {
  public let operationDefinition =
    "query FindTagsByTeam($teamId: ID!) {\n  findTagsByTeam(teamId: $teamId) {\n    __typename\n    id\n    name\n  }\n}"

  public var teamId: GraphQLID

  public init(teamId: GraphQLID) {
    self.teamId = teamId
  }

  public var variables: GraphQLMap? {
    return ["teamId": teamId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("findTagsByTeam", arguments: ["teamId": GraphQLVariable("teamId")], type: .list(.object(FindTagsByTeam.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(findTagsByTeam: [FindTagsByTeam?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "findTagsByTeam": findTagsByTeam.flatMap { (value: [FindTagsByTeam?]) -> [ResultMap?] in value.map { (value: FindTagsByTeam?) -> ResultMap? in value.flatMap { (value: FindTagsByTeam) -> ResultMap in value.resultMap } } }])
    }

    public var findTagsByTeam: [FindTagsByTeam?]? {
      get {
        return (resultMap["findTagsByTeam"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [FindTagsByTeam?] in value.map { (value: ResultMap?) -> FindTagsByTeam? in value.flatMap { (value: ResultMap) -> FindTagsByTeam in FindTagsByTeam(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [FindTagsByTeam?]) -> [ResultMap?] in value.map { (value: FindTagsByTeam?) -> ResultMap? in value.flatMap { (value: FindTagsByTeam) -> ResultMap in value.resultMap } } }, forKey: "findTagsByTeam")
      }
    }

    public struct FindTagsByTeam: GraphQLSelectionSet {
      public static let possibleTypes = ["Tag"]

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
        self.init(unsafeResultMap: ["__typename": "Tag", "id": id, "name": name])
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

public final class MoveToFolderMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation MoveToFolder($id: ID!, $title: String) {\n  updateFolderTitle(folderId: $id, title: $title) {\n    __typename\n    id\n    title\n  }\n}"

  public var id: GraphQLID
  public var title: String?

  public init(id: GraphQLID, title: String? = nil) {
    self.id = id
    self.title = title
  }

  public var variables: GraphQLMap? {
    return ["id": id, "title": title]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateFolderTitle", arguments: ["folderId": GraphQLVariable("id"), "title": GraphQLVariable("title")], type: .object(UpdateFolderTitle.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateFolderTitle: UpdateFolderTitle? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateFolderTitle": updateFolderTitle.flatMap { (value: UpdateFolderTitle) -> ResultMap in value.resultMap }])
    }

    public var updateFolderTitle: UpdateFolderTitle? {
      get {
        return (resultMap["updateFolderTitle"] as? ResultMap).flatMap { UpdateFolderTitle(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateFolderTitle")
      }
    }

    public struct UpdateFolderTitle: GraphQLSelectionSet {
      public static let possibleTypes = ["Folder"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String) {
        self.init(unsafeResultMap: ["__typename": "Folder", "id": id, "title": title])
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

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }
    }
  }
}

public final class FetchAllUsersQuery: GraphQLQuery {
  public let operationDefinition =
    "query FetchAllUsers {\n  users {\n    __typename\n    id\n    name\n    role\n    email\n    profilePic\n    phone\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("users", type: .list(.object(User.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(users: [User?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "users": users.flatMap { (value: [User?]) -> [ResultMap?] in value.map { (value: User?) -> ResultMap? in value.flatMap { (value: User) -> ResultMap in value.resultMap } } }])
    }

    public var users: [User?]? {
      get {
        return (resultMap["users"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [User?] in value.map { (value: ResultMap?) -> User? in value.flatMap { (value: ResultMap) -> User in User(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [User?]) -> [ResultMap?] in value.map { (value: User?) -> ResultMap? in value.flatMap { (value: User) -> ResultMap in value.resultMap } } }, forKey: "users")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("role", type: .scalar(Role.self)),
        GraphQLField("email", type: .scalar(String.self)),
        GraphQLField("profilePic", type: .scalar(String.self)),
        GraphQLField("phone", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String? = nil, role: Role? = nil, email: String? = nil, profilePic: String? = nil, phone: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "role": role, "email": email, "profilePic": profilePic, "phone": phone])
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

      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var role: Role? {
        get {
          return resultMap["role"] as? Role
        }
        set {
          resultMap.updateValue(newValue, forKey: "role")
        }
      }

      public var email: String? {
        get {
          return resultMap["email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var profilePic: String? {
        get {
          return resultMap["profilePic"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "profilePic")
        }
      }

      public var phone: String? {
        get {
          return resultMap["phone"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "phone")
        }
      }
    }
  }
}

public final class AddUserToTeamMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation AddUserToTeam($teamId: ID!, $userId: ID!) {\n  addUserToTeam(teamId: $teamId, userId: $userId) {\n    __typename\n    id\n  }\n}"

  public var teamId: GraphQLID
  public var userId: GraphQLID

  public init(teamId: GraphQLID, userId: GraphQLID) {
    self.teamId = teamId
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["teamId": teamId, "userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("addUserToTeam", arguments: ["teamId": GraphQLVariable("teamId"), "userId": GraphQLVariable("userId")], type: .object(AddUserToTeam.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addUserToTeam: AddUserToTeam? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addUserToTeam": addUserToTeam.flatMap { (value: AddUserToTeam) -> ResultMap in value.resultMap }])
    }

    public var addUserToTeam: AddUserToTeam? {
      get {
        return (resultMap["addUserToTeam"] as? ResultMap).flatMap { AddUserToTeam(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "addUserToTeam")
      }
    }

    public struct AddUserToTeam: GraphQLSelectionSet {
      public static let possibleTypes = ["Team"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Team", "id": id])
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
    }
  }
}

public final class AddNewDocumentMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation AddNewDocument($title: String!, $doc_url: String!, $userId: ID!, $teamId: ID!, $textContent: String!, $tagId: ID) {\n  addDocument(title: $title, doc_url: $doc_url, teamId: $teamId, userId: $userId, textContent: $textContent, tagId: $tagId) {\n    __typename\n    title\n    id\n  }\n}"

  public var title: String
  public var doc_url: String
  public var userId: GraphQLID
  public var teamId: GraphQLID
  public var textContent: String
  public var tagId: GraphQLID?

  public init(title: String, doc_url: String, userId: GraphQLID, teamId: GraphQLID, textContent: String, tagId: GraphQLID? = nil) {
    self.title = title
    self.doc_url = doc_url
    self.userId = userId
    self.teamId = teamId
    self.textContent = textContent
    self.tagId = tagId
  }

  public var variables: GraphQLMap? {
    return ["title": title, "doc_url": doc_url, "userId": userId, "teamId": teamId, "textContent": textContent, "tagId": tagId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("addDocument", arguments: ["title": GraphQLVariable("title"), "doc_url": GraphQLVariable("doc_url"), "teamId": GraphQLVariable("teamId"), "userId": GraphQLVariable("userId"), "textContent": GraphQLVariable("textContent"), "tagId": GraphQLVariable("tagId")], type: .object(AddDocument.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addDocument: AddDocument? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addDocument": addDocument.flatMap { (value: AddDocument) -> ResultMap in value.resultMap }])
    }

    public var addDocument: AddDocument? {
      get {
        return (resultMap["addDocument"] as? ResultMap).flatMap { AddDocument(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "addDocument")
      }
    }

    public struct AddDocument: GraphQLSelectionSet {
      public static let possibleTypes = ["Document"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(title: String, id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Document", "title": title, "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
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
    }
  }
}

public final class UpdateDocumentMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation UpdateDocument($id: ID!, $title: String, $doc_url: String, $folderId: ID, $textContent: String, $tag: ID) {\n  updateDocument(documentId: $id, title: $title, doc_url: $doc_url, folderId: $folderId, textContent: $textContent, tagId: $tag) {\n    __typename\n    title\n    id\n  }\n}"

  public var id: GraphQLID
  public var title: String?
  public var doc_url: String?
  public var folderId: GraphQLID?
  public var textContent: String?
  public var tag: GraphQLID?

  public init(id: GraphQLID, title: String? = nil, doc_url: String? = nil, folderId: GraphQLID? = nil, textContent: String? = nil, tag: GraphQLID? = nil) {
    self.id = id
    self.title = title
    self.doc_url = doc_url
    self.folderId = folderId
    self.textContent = textContent
    self.tag = tag
  }

  public var variables: GraphQLMap? {
    return ["id": id, "title": title, "doc_url": doc_url, "folderId": folderId, "textContent": textContent, "tag": tag]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateDocument", arguments: ["documentId": GraphQLVariable("id"), "title": GraphQLVariable("title"), "doc_url": GraphQLVariable("doc_url"), "folderId": GraphQLVariable("folderId"), "textContent": GraphQLVariable("textContent"), "tagId": GraphQLVariable("tag")], type: .object(UpdateDocument.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateDocument: UpdateDocument? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateDocument": updateDocument.flatMap { (value: UpdateDocument) -> ResultMap in value.resultMap }])
    }

    public var updateDocument: UpdateDocument? {
      get {
        return (resultMap["updateDocument"] as? ResultMap).flatMap { UpdateDocument(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateDocument")
      }
    }

    public struct UpdateDocument: GraphQLSelectionSet {
      public static let possibleTypes = ["Document"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(title: String, id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Document", "title": title, "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
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
    }
  }
}

public final class CreateNewTagMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation CreateNewTag($name: String!, $teamId: ID!) {\n  addTag(name: $name, teamId: $teamId) {\n    __typename\n    id\n    createdAt\n    name\n    team {\n      __typename\n      id\n      teamName\n    }\n  }\n}"

  public var name: String
  public var teamId: GraphQLID

  public init(name: String, teamId: GraphQLID) {
    self.name = name
    self.teamId = teamId
  }

  public var variables: GraphQLMap? {
    return ["name": name, "teamId": teamId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("addTag", arguments: ["name": GraphQLVariable("name"), "teamId": GraphQLVariable("teamId")], type: .object(AddTag.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addTag: AddTag? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addTag": addTag.flatMap { (value: AddTag) -> ResultMap in value.resultMap }])
    }

    public var addTag: AddTag? {
      get {
        return (resultMap["addTag"] as? ResultMap).flatMap { AddTag(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "addTag")
      }
    }

    public struct AddTag: GraphQLSelectionSet {
      public static let possibleTypes = ["Tag"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("team", type: .object(Team.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, createdAt: String? = nil, name: String, team: Team? = nil) {
        self.init(unsafeResultMap: ["__typename": "Tag", "id": id, "createdAt": createdAt, "name": name, "team": team.flatMap { (value: Team) -> ResultMap in value.resultMap }])
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

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
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

      public var team: Team? {
        get {
          return (resultMap["team"] as? ResultMap).flatMap { Team(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "team")
        }
      }

      public struct Team: GraphQLSelectionSet {
        public static let possibleTypes = ["Team"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("teamName", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, teamName: String) {
          self.init(unsafeResultMap: ["__typename": "Team", "id": id, "teamName": teamName])
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

        public var teamName: String {
          get {
            return resultMap["teamName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "teamName")
          }
        }
      }
    }
  }
}

public final class FindCommentsByMessageQuery: GraphQLQuery {
  public let operationDefinition =
    "query FindCommentsByMessage($messageId: ID!) {\n  findMessageCommentsByMessage(messageId: $messageId) {\n    __typename\n    id\n    user {\n      __typename\n      name\n      profilePic\n      id\n    }\n    content\n    image\n    likes {\n      __typename\n      id\n      name\n    }\n    createdAt\n  }\n}"

  public var messageId: GraphQLID

  public init(messageId: GraphQLID) {
    self.messageId = messageId
  }

  public var variables: GraphQLMap? {
    return ["messageId": messageId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("findMessageCommentsByMessage", arguments: ["messageId": GraphQLVariable("messageId")], type: .list(.object(FindMessageCommentsByMessage.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(findMessageCommentsByMessage: [FindMessageCommentsByMessage?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "findMessageCommentsByMessage": findMessageCommentsByMessage.flatMap { (value: [FindMessageCommentsByMessage?]) -> [ResultMap?] in value.map { (value: FindMessageCommentsByMessage?) -> ResultMap? in value.flatMap { (value: FindMessageCommentsByMessage) -> ResultMap in value.resultMap } } }])
    }

    public var findMessageCommentsByMessage: [FindMessageCommentsByMessage?]? {
      get {
        return (resultMap["findMessageCommentsByMessage"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [FindMessageCommentsByMessage?] in value.map { (value: ResultMap?) -> FindMessageCommentsByMessage? in value.flatMap { (value: ResultMap) -> FindMessageCommentsByMessage in FindMessageCommentsByMessage(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [FindMessageCommentsByMessage?]) -> [ResultMap?] in value.map { (value: FindMessageCommentsByMessage?) -> ResultMap? in value.flatMap { (value: FindMessageCommentsByMessage) -> ResultMap in value.resultMap } } }, forKey: "findMessageCommentsByMessage")
      }
    }

    public struct FindMessageCommentsByMessage: GraphQLSelectionSet {
      public static let possibleTypes = ["MessageComment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("user", type: .nonNull(.object(User.selections))),
        GraphQLField("content", type: .nonNull(.scalar(String.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("likes", type: .list(.object(Like.selections))),
        GraphQLField("createdAt", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, user: User, content: String, image: String? = nil, likes: [Like?]? = nil, createdAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "MessageComment", "id": id, "user": user.resultMap, "content": content, "image": image, "likes": likes.flatMap { (value: [Like?]) -> [ResultMap?] in value.map { (value: Like?) -> ResultMap? in value.flatMap { (value: Like) -> ResultMap in value.resultMap } } }, "createdAt": createdAt])
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

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public var content: String {
        get {
          return resultMap["content"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "content")
        }
      }

      public var image: String? {
        get {
          return resultMap["image"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
        }
      }

      public var likes: [Like?]? {
        get {
          return (resultMap["likes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Like?] in value.map { (value: ResultMap?) -> Like? in value.flatMap { (value: ResultMap) -> Like in Like(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Like?]) -> [ResultMap?] in value.map { (value: Like?) -> ResultMap? in value.flatMap { (value: Like) -> ResultMap in value.resultMap } } }, forKey: "likes")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("profilePic", type: .scalar(String.self)),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, profilePic: String? = nil, id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "User", "name": name, "profilePic": profilePic, "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var profilePic: String? {
          get {
            return resultMap["profilePic"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profilePic")
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
      }

      public struct Like: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil) {
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

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class LikeCommentMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation likeComment($id: ID!, $userId: ID!) {\n  likeMessageComment(commentId: $id, userId: $userId) {\n    __typename\n    id\n  }\n}"

  public var id: GraphQLID
  public var userId: GraphQLID

  public init(id: GraphQLID, userId: GraphQLID) {
    self.id = id
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["id": id, "userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("likeMessageComment", arguments: ["commentId": GraphQLVariable("id"), "userId": GraphQLVariable("userId")], type: .object(LikeMessageComment.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(likeMessageComment: LikeMessageComment? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "likeMessageComment": likeMessageComment.flatMap { (value: LikeMessageComment) -> ResultMap in value.resultMap }])
    }

    public var likeMessageComment: LikeMessageComment? {
      get {
        return (resultMap["likeMessageComment"] as? ResultMap).flatMap { LikeMessageComment(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "likeMessageComment")
      }
    }

    public struct LikeMessageComment: GraphQLSelectionSet {
      public static let possibleTypes = ["MessageComment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "MessageComment", "id": id])
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
    }
  }
}

public final class UnlikeCommentMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation unlikeComment($id: ID!, $userId: ID!) {\n  unlikeMessageComment(commentId: $id, userId: $userId) {\n    __typename\n    id\n  }\n}"

  public var id: GraphQLID
  public var userId: GraphQLID

  public init(id: GraphQLID, userId: GraphQLID) {
    self.id = id
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["id": id, "userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("unlikeMessageComment", arguments: ["commentId": GraphQLVariable("id"), "userId": GraphQLVariable("userId")], type: .object(UnlikeMessageComment.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(unlikeMessageComment: UnlikeMessageComment? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "unlikeMessageComment": unlikeMessageComment.flatMap { (value: UnlikeMessageComment) -> ResultMap in value.resultMap }])
    }

    public var unlikeMessageComment: UnlikeMessageComment? {
      get {
        return (resultMap["unlikeMessageComment"] as? ResultMap).flatMap { UnlikeMessageComment(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "unlikeMessageComment")
      }
    }

    public struct UnlikeMessageComment: GraphQLSelectionSet {
      public static let possibleTypes = ["MessageComment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "MessageComment", "id": id])
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
    }
  }
}

public final class DeleteCommentMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation deleteComment($id: ID!) {\n  deleteMessageComment(commentId: $id) {\n    __typename\n    id\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteMessageComment", arguments: ["commentId": GraphQLVariable("id")], type: .object(DeleteMessageComment.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteMessageComment: DeleteMessageComment? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteMessageComment": deleteMessageComment.flatMap { (value: DeleteMessageComment) -> ResultMap in value.resultMap }])
    }

    public var deleteMessageComment: DeleteMessageComment? {
      get {
        return (resultMap["deleteMessageComment"] as? ResultMap).flatMap { DeleteMessageComment(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "deleteMessageComment")
      }
    }

    public struct DeleteMessageComment: GraphQLSelectionSet {
      public static let possibleTypes = ["MessageComment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "MessageComment", "id": id])
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
    }
  }
}

public final class FindDocumentsByFolderQuery: GraphQLQuery {
  public let operationDefinition =
    "query FindDocumentsByFolder($folderID: ID!) {\n  findFolder(id: $folderID) {\n    __typename\n    id\n    documents {\n      __typename\n      id\n      doc_url\n      title\n      textContent\n      images\n      comments {\n        __typename\n        id\n        content\n      }\n      createdAt\n    }\n    user {\n      __typename\n      name\n      profilePic\n      id\n    }\n  }\n}"

  public var folderID: GraphQLID

  public init(folderID: GraphQLID) {
    self.folderID = folderID
  }

  public var variables: GraphQLMap? {
    return ["folderID": folderID]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("findFolder", arguments: ["id": GraphQLVariable("folderID")], type: .object(FindFolder.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(findFolder: FindFolder? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "findFolder": findFolder.flatMap { (value: FindFolder) -> ResultMap in value.resultMap }])
    }

    public var findFolder: FindFolder? {
      get {
        return (resultMap["findFolder"] as? ResultMap).flatMap { FindFolder(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "findFolder")
      }
    }

    public struct FindFolder: GraphQLSelectionSet {
      public static let possibleTypes = ["Folder"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("documents", type: .list(.object(Document.selections))),
        GraphQLField("user", type: .nonNull(.object(User.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, documents: [Document?]? = nil, user: User) {
        self.init(unsafeResultMap: ["__typename": "Folder", "id": id, "documents": documents.flatMap { (value: [Document?]) -> [ResultMap?] in value.map { (value: Document?) -> ResultMap? in value.flatMap { (value: Document) -> ResultMap in value.resultMap } } }, "user": user.resultMap])
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

      public var documents: [Document?]? {
        get {
          return (resultMap["documents"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Document?] in value.map { (value: ResultMap?) -> Document? in value.flatMap { (value: ResultMap) -> Document in Document(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Document?]) -> [ResultMap?] in value.map { (value: Document?) -> ResultMap? in value.flatMap { (value: Document) -> ResultMap in value.resultMap } } }, forKey: "documents")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public struct Document: GraphQLSelectionSet {
        public static let possibleTypes = ["Document"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("doc_url", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("textContent", type: .nonNull(.scalar(String.self))),
          GraphQLField("images", type: .list(.scalar(String.self))),
          GraphQLField("comments", type: .list(.object(Comment.selections))),
          GraphQLField("createdAt", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, docUrl: String, title: String, textContent: String, images: [String?]? = nil, comments: [Comment?]? = nil, createdAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Document", "id": id, "doc_url": docUrl, "title": title, "textContent": textContent, "images": images, "comments": comments.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }, "createdAt": createdAt])
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

        public var docUrl: String {
          get {
            return resultMap["doc_url"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "doc_url")
          }
        }

        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        public var textContent: String {
          get {
            return resultMap["textContent"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "textContent")
          }
        }

        public var images: [String?]? {
          get {
            return resultMap["images"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "images")
          }
        }

        public var comments: [Comment?]? {
          get {
            return (resultMap["comments"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Comment?] in value.map { (value: ResultMap?) -> Comment? in value.flatMap { (value: ResultMap) -> Comment in Comment(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }, forKey: "comments")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["createdAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        public struct Comment: GraphQLSelectionSet {
          public static let possibleTypes = ["DocumentComment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, content: String) {
            self.init(unsafeResultMap: ["__typename": "DocumentComment", "id": id, "content": content])
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

          public var content: String {
            get {
              return resultMap["content"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "content")
            }
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("profilePic", type: .scalar(String.self)),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, profilePic: String? = nil, id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "User", "name": name, "profilePic": profilePic, "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var profilePic: String? {
          get {
            return resultMap["profilePic"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profilePic")
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
      }
    }
  }
}

public final class FindCommentsByDocumentQuery: GraphQLQuery {
  public let operationDefinition =
    "query FindCommentsByDocument($documentID: ID!) {\n  findDocumentComment(id: $documentID) {\n    __typename\n    id\n    user {\n      __typename\n      name\n      profilePic\n      id\n    }\n    content\n    image\n    likes {\n      __typename\n      id\n      name\n    }\n    createdAt\n  }\n}"

  public var documentID: GraphQLID

  public init(documentID: GraphQLID) {
    self.documentID = documentID
  }

  public var variables: GraphQLMap? {
    return ["documentID": documentID]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("findDocumentComment", arguments: ["id": GraphQLVariable("documentID")], type: .object(FindDocumentComment.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(findDocumentComment: FindDocumentComment? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "findDocumentComment": findDocumentComment.flatMap { (value: FindDocumentComment) -> ResultMap in value.resultMap }])
    }

    public var findDocumentComment: FindDocumentComment? {
      get {
        return (resultMap["findDocumentComment"] as? ResultMap).flatMap { FindDocumentComment(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "findDocumentComment")
      }
    }

    public struct FindDocumentComment: GraphQLSelectionSet {
      public static let possibleTypes = ["DocumentComment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("user", type: .nonNull(.object(User.selections))),
        GraphQLField("content", type: .nonNull(.scalar(String.self))),
        GraphQLField("image", type: .scalar(String.self)),
        GraphQLField("likes", type: .list(.object(Like.selections))),
        GraphQLField("createdAt", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, user: User, content: String, image: String? = nil, likes: [Like?]? = nil, createdAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "DocumentComment", "id": id, "user": user.resultMap, "content": content, "image": image, "likes": likes.flatMap { (value: [Like?]) -> [ResultMap?] in value.map { (value: Like?) -> ResultMap? in value.flatMap { (value: Like) -> ResultMap in value.resultMap } } }, "createdAt": createdAt])
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

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public var content: String {
        get {
          return resultMap["content"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "content")
        }
      }

      public var image: String? {
        get {
          return resultMap["image"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
        }
      }

      public var likes: [Like?]? {
        get {
          return (resultMap["likes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Like?] in value.map { (value: ResultMap?) -> Like? in value.flatMap { (value: ResultMap) -> Like in Like(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Like?]) -> [ResultMap?] in value.map { (value: Like?) -> ResultMap? in value.flatMap { (value: Like) -> ResultMap in value.resultMap } } }, forKey: "likes")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("profilePic", type: .scalar(String.self)),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, profilePic: String? = nil, id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "User", "name": name, "profilePic": profilePic, "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var profilePic: String? {
          get {
            return resultMap["profilePic"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profilePic")
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
      }

      public struct Like: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String? = nil) {
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

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class LikeDocumentCommentMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation likeDocumentComment($id: ID!, $userId: ID!) {\n  likeDocumentComment(commentId: $id, userId: $userId) {\n    __typename\n    id\n  }\n}"

  public var id: GraphQLID
  public var userId: GraphQLID

  public init(id: GraphQLID, userId: GraphQLID) {
    self.id = id
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["id": id, "userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("likeDocumentComment", arguments: ["commentId": GraphQLVariable("id"), "userId": GraphQLVariable("userId")], type: .object(LikeDocumentComment.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(likeDocumentComment: LikeDocumentComment? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "likeDocumentComment": likeDocumentComment.flatMap { (value: LikeDocumentComment) -> ResultMap in value.resultMap }])
    }

    public var likeDocumentComment: LikeDocumentComment? {
      get {
        return (resultMap["likeDocumentComment"] as? ResultMap).flatMap { LikeDocumentComment(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "likeDocumentComment")
      }
    }

    public struct LikeDocumentComment: GraphQLSelectionSet {
      public static let possibleTypes = ["DocumentComment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "DocumentComment", "id": id])
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
    }
  }
}

public final class UnlikeDocumentCommentMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation unlikeDocumentComment($id: ID!, $userId: ID!) {\n  unlikeDocumentComment(commentId: $id, userId: $userId) {\n    __typename\n    id\n  }\n}"

  public var id: GraphQLID
  public var userId: GraphQLID

  public init(id: GraphQLID, userId: GraphQLID) {
    self.id = id
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["id": id, "userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("unlikeDocumentComment", arguments: ["commentId": GraphQLVariable("id"), "userId": GraphQLVariable("userId")], type: .object(UnlikeDocumentComment.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(unlikeDocumentComment: UnlikeDocumentComment? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "unlikeDocumentComment": unlikeDocumentComment.flatMap { (value: UnlikeDocumentComment) -> ResultMap in value.resultMap }])
    }

    public var unlikeDocumentComment: UnlikeDocumentComment? {
      get {
        return (resultMap["unlikeDocumentComment"] as? ResultMap).flatMap { UnlikeDocumentComment(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "unlikeDocumentComment")
      }
    }

    public struct UnlikeDocumentComment: GraphQLSelectionSet {
      public static let possibleTypes = ["DocumentComment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "DocumentComment", "id": id])
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
    }
  }
}

public final class DeleteDocumentCommentMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation deleteDocumentComment($id: ID!) {\n  deleteDocumentComment(documentCommentId: $id) {\n    __typename\n    id\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteDocumentComment", arguments: ["documentCommentId": GraphQLVariable("id")], type: .object(DeleteDocumentComment.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteDocumentComment: DeleteDocumentComment? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteDocumentComment": deleteDocumentComment.flatMap { (value: DeleteDocumentComment) -> ResultMap in value.resultMap }])
    }

    public var deleteDocumentComment: DeleteDocumentComment? {
      get {
        return (resultMap["deleteDocumentComment"] as? ResultMap).flatMap { DeleteDocumentComment(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "deleteDocumentComment")
      }
    }

    public struct DeleteDocumentComment: GraphQLSelectionSet {
      public static let possibleTypes = ["DocumentComment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "DocumentComment", "id": id])
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
    }
  }
}

public final class UpdateUserMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation UpdateUser($id: ID!, $name: String, $email: String, $phoneNumber: String, $avatar: String) {\n  updateUserContactInfo(id: $id, name: $name, email: $email, phone: $phoneNumber, profilePic: $avatar) {\n    __typename\n    id\n  }\n}"

  public var id: GraphQLID
  public var name: String?
  public var email: String?
  public var phoneNumber: String?
  public var avatar: String?

  public init(id: GraphQLID, name: String? = nil, email: String? = nil, phoneNumber: String? = nil, avatar: String? = nil) {
    self.id = id
    self.name = name
    self.email = email
    self.phoneNumber = phoneNumber
    self.avatar = avatar
  }

  public var variables: GraphQLMap? {
    return ["id": id, "name": name, "email": email, "phoneNumber": phoneNumber, "avatar": avatar]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateUserContactInfo", arguments: ["id": GraphQLVariable("id"), "name": GraphQLVariable("name"), "email": GraphQLVariable("email"), "phone": GraphQLVariable("phoneNumber"), "profilePic": GraphQLVariable("avatar")], type: .nonNull(.object(UpdateUserContactInfo.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateUserContactInfo: UpdateUserContactInfo) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateUserContactInfo": updateUserContactInfo.resultMap])
    }

    public var updateUserContactInfo: UpdateUserContactInfo {
      get {
        return UpdateUserContactInfo(unsafeResultMap: resultMap["updateUserContactInfo"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "updateUserContactInfo")
      }
    }

    public struct UpdateUserContactInfo: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id])
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
    }
  }
}

public final class AddNewMessageMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation AddNewMessage($title: String!, $teamId: ID!, $userId: ID!, $content: String!) {\n  createMessage(title: $title, teamId: $teamId, userId: $userId, content: $content) {\n    __typename\n    title\n    id\n    images\n    tag {\n      __typename\n      id\n    }\n  }\n}"

  public var title: String
  public var teamId: GraphQLID
  public var userId: GraphQLID
  public var content: String

  public init(title: String, teamId: GraphQLID, userId: GraphQLID, content: String) {
    self.title = title
    self.teamId = teamId
    self.userId = userId
    self.content = content
  }

  public var variables: GraphQLMap? {
    return ["title": title, "teamId": teamId, "userId": userId, "content": content]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createMessage", arguments: ["title": GraphQLVariable("title"), "teamId": GraphQLVariable("teamId"), "userId": GraphQLVariable("userId"), "content": GraphQLVariable("content")], type: .object(CreateMessage.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createMessage: CreateMessage? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createMessage": createMessage.flatMap { (value: CreateMessage) -> ResultMap in value.resultMap }])
    }

    public var createMessage: CreateMessage? {
      get {
        return (resultMap["createMessage"] as? ResultMap).flatMap { CreateMessage(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createMessage")
      }
    }

    public struct CreateMessage: GraphQLSelectionSet {
      public static let possibleTypes = ["Message"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("images", type: .list(.scalar(String.self))),
        GraphQLField("tag", type: .object(Tag.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(title: String, id: GraphQLID, images: [String?]? = nil, tag: Tag? = nil) {
        self.init(unsafeResultMap: ["__typename": "Message", "title": title, "id": id, "images": images, "tag": tag.flatMap { (value: Tag) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
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

      public var images: [String?]? {
        get {
          return resultMap["images"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "images")
        }
      }

      public var tag: Tag? {
        get {
          return (resultMap["tag"] as? ResultMap).flatMap { Tag(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "tag")
        }
      }

      public struct Tag: GraphQLSelectionSet {
        public static let possibleTypes = ["Tag"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Tag", "id": id])
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
      }
    }
  }
}

public final class UpdateMessageMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation UpdateMessage($title: String, $content: String, $id: ID!) {\n  updateMessage(messageId: $id, content: $content, title: $title) {\n    __typename\n    title\n    inTeam {\n      __typename\n      teamName\n    }\n    content\n    images\n    tag {\n      __typename\n      id\n    }\n  }\n}"

  public var title: String?
  public var content: String?
  public var id: GraphQLID

  public init(title: String? = nil, content: String? = nil, id: GraphQLID) {
    self.title = title
    self.content = content
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["title": title, "content": content, "id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateMessage", arguments: ["messageId": GraphQLVariable("id"), "content": GraphQLVariable("content"), "title": GraphQLVariable("title")], type: .object(UpdateMessage.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateMessage: UpdateMessage? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateMessage": updateMessage.flatMap { (value: UpdateMessage) -> ResultMap in value.resultMap }])
    }

    public var updateMessage: UpdateMessage? {
      get {
        return (resultMap["updateMessage"] as? ResultMap).flatMap { UpdateMessage(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateMessage")
      }
    }

    public struct UpdateMessage: GraphQLSelectionSet {
      public static let possibleTypes = ["Message"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("inTeam", type: .nonNull(.object(InTeam.selections))),
        GraphQLField("content", type: .nonNull(.scalar(String.self))),
        GraphQLField("images", type: .list(.scalar(String.self))),
        GraphQLField("tag", type: .object(Tag.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(title: String, inTeam: InTeam, content: String, images: [String?]? = nil, tag: Tag? = nil) {
        self.init(unsafeResultMap: ["__typename": "Message", "title": title, "inTeam": inTeam.resultMap, "content": content, "images": images, "tag": tag.flatMap { (value: Tag) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var inTeam: InTeam {
        get {
          return InTeam(unsafeResultMap: resultMap["inTeam"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "inTeam")
        }
      }

      public var content: String {
        get {
          return resultMap["content"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "content")
        }
      }

      public var images: [String?]? {
        get {
          return resultMap["images"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "images")
        }
      }

      public var tag: Tag? {
        get {
          return (resultMap["tag"] as? ResultMap).flatMap { Tag(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "tag")
        }
      }

      public struct InTeam: GraphQLSelectionSet {
        public static let possibleTypes = ["Team"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("teamName", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(teamName: String) {
          self.init(unsafeResultMap: ["__typename": "Team", "teamName": teamName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var teamName: String {
          get {
            return resultMap["teamName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "teamName")
          }
        }
      }

      public struct Tag: GraphQLSelectionSet {
        public static let possibleTypes = ["Tag"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Tag", "id": id])
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
      }
    }
  }
}

public final class TeamsByUserQuery: GraphQLQuery {
  public let operationDefinition =
    "query teamsByUser($userId: ID) {\n  teamsByUser(userId: $userId) {\n    __typename\n    id\n    teamName\n    premium\n  }\n}"

  public var userId: GraphQLID?

  public init(userId: GraphQLID? = nil) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("teamsByUser", arguments: ["userId": GraphQLVariable("userId")], type: .list(.object(TeamsByUser.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(teamsByUser: [TeamsByUser?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "teamsByUser": teamsByUser.flatMap { (value: [TeamsByUser?]) -> [ResultMap?] in value.map { (value: TeamsByUser?) -> ResultMap? in value.flatMap { (value: TeamsByUser) -> ResultMap in value.resultMap } } }])
    }

    public var teamsByUser: [TeamsByUser?]? {
      get {
        return (resultMap["teamsByUser"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [TeamsByUser?] in value.map { (value: ResultMap?) -> TeamsByUser? in value.flatMap { (value: ResultMap) -> TeamsByUser in TeamsByUser(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [TeamsByUser?]) -> [ResultMap?] in value.map { (value: TeamsByUser?) -> ResultMap? in value.flatMap { (value: TeamsByUser) -> ResultMap in value.resultMap } } }, forKey: "teamsByUser")
      }
    }

    public struct TeamsByUser: GraphQLSelectionSet {
      public static let possibleTypes = ["Team"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("teamName", type: .nonNull(.scalar(String.self))),
        GraphQLField("premium", type: .scalar(Bool.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, teamName: String, premium: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "Team", "id": id, "teamName": teamName, "premium": premium])
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

      public var teamName: String {
        get {
          return resultMap["teamName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "teamName")
        }
      }

      public var premium: Bool? {
        get {
          return resultMap["premium"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "premium")
        }
      }
    }
  }
}

public final class CreateTeamMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation CreateTeam($teamName: String!, $userId: ID!) {\n  createTeam(teamName: $teamName, userId: $userId) {\n    __typename\n    id\n  }\n}"

  public var teamName: String
  public var userId: GraphQLID

  public init(teamName: String, userId: GraphQLID) {
    self.teamName = teamName
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["teamName": teamName, "userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createTeam", arguments: ["teamName": GraphQLVariable("teamName"), "userId": GraphQLVariable("userId")], type: .object(CreateTeam.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createTeam: CreateTeam? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createTeam": createTeam.flatMap { (value: CreateTeam) -> ResultMap in value.resultMap }])
    }

    public var createTeam: CreateTeam? {
      get {
        return (resultMap["createTeam"] as? ResultMap).flatMap { CreateTeam(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createTeam")
      }
    }

    public struct CreateTeam: GraphQLSelectionSet {
      public static let possibleTypes = ["Team"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Team", "id": id])
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
    }
  }
}

public final class FindActivityByTeamQuery: GraphQLQuery {
  public let operationDefinition =
    "query FindActivityByTeam($teamId: ID!) {\n  messages(teamId: $teamId) {\n    __typename\n    id\n    title\n    creator {\n      __typename\n      name\n      profilePic\n      id\n    }\n    content\n    images\n    tag {\n      __typename\n      name\n    }\n    createdAt\n  }\n}"

  public var teamId: GraphQLID

  public init(teamId: GraphQLID) {
    self.teamId = teamId
  }

  public var variables: GraphQLMap? {
    return ["teamId": teamId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("messages", arguments: ["teamId": GraphQLVariable("teamId")], type: .list(.object(Message.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(messages: [Message?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "messages": messages.flatMap { (value: [Message?]) -> [ResultMap?] in value.map { (value: Message?) -> ResultMap? in value.flatMap { (value: Message) -> ResultMap in value.resultMap } } }])
    }

    public var messages: [Message?]? {
      get {
        return (resultMap["messages"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Message?] in value.map { (value: ResultMap?) -> Message? in value.flatMap { (value: ResultMap) -> Message in Message(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Message?]) -> [ResultMap?] in value.map { (value: Message?) -> ResultMap? in value.flatMap { (value: Message) -> ResultMap in value.resultMap } } }, forKey: "messages")
      }
    }

    public struct Message: GraphQLSelectionSet {
      public static let possibleTypes = ["Message"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("creator", type: .nonNull(.object(Creator.selections))),
        GraphQLField("content", type: .nonNull(.scalar(String.self))),
        GraphQLField("images", type: .list(.scalar(String.self))),
        GraphQLField("tag", type: .object(Tag.selections)),
        GraphQLField("createdAt", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String, creator: Creator, content: String, images: [String?]? = nil, tag: Tag? = nil, createdAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Message", "id": id, "title": title, "creator": creator.resultMap, "content": content, "images": images, "tag": tag.flatMap { (value: Tag) -> ResultMap in value.resultMap }, "createdAt": createdAt])
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

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var creator: Creator {
        get {
          return Creator(unsafeResultMap: resultMap["creator"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "creator")
        }
      }

      public var content: String {
        get {
          return resultMap["content"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "content")
        }
      }

      public var images: [String?]? {
        get {
          return resultMap["images"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "images")
        }
      }

      public var tag: Tag? {
        get {
          return (resultMap["tag"] as? ResultMap).flatMap { Tag(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "tag")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public struct Creator: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("profilePic", type: .scalar(String.self)),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, profilePic: String? = nil, id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "User", "name": name, "profilePic": profilePic, "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var profilePic: String? {
          get {
            return resultMap["profilePic"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profilePic")
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
      }

      public struct Tag: GraphQLSelectionSet {
        public static let possibleTypes = ["Tag"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String) {
          self.init(unsafeResultMap: ["__typename": "Tag", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

public final class FindDocumentActivityByTeamQuery: GraphQLQuery {
  public let operationDefinition =
    "query FindDocumentActivityByTeam($teamId: ID!) {\n  findDocumentsByTeam(teamId: $teamId) {\n    __typename\n    id\n    doc_url\n    user {\n      __typename\n      name\n      profilePic\n      id\n    }\n    folder {\n      __typename\n      id\n      title\n    }\n    title\n    textContent\n    createdAt\n  }\n}"

  public var teamId: GraphQLID

  public init(teamId: GraphQLID) {
    self.teamId = teamId
  }

  public var variables: GraphQLMap? {
    return ["teamId": teamId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("findDocumentsByTeam", arguments: ["teamId": GraphQLVariable("teamId")], type: .list(.object(FindDocumentsByTeam.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(findDocumentsByTeam: [FindDocumentsByTeam?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "findDocumentsByTeam": findDocumentsByTeam.flatMap { (value: [FindDocumentsByTeam?]) -> [ResultMap?] in value.map { (value: FindDocumentsByTeam?) -> ResultMap? in value.flatMap { (value: FindDocumentsByTeam) -> ResultMap in value.resultMap } } }])
    }

    public var findDocumentsByTeam: [FindDocumentsByTeam?]? {
      get {
        return (resultMap["findDocumentsByTeam"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [FindDocumentsByTeam?] in value.map { (value: ResultMap?) -> FindDocumentsByTeam? in value.flatMap { (value: ResultMap) -> FindDocumentsByTeam in FindDocumentsByTeam(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [FindDocumentsByTeam?]) -> [ResultMap?] in value.map { (value: FindDocumentsByTeam?) -> ResultMap? in value.flatMap { (value: FindDocumentsByTeam) -> ResultMap in value.resultMap } } }, forKey: "findDocumentsByTeam")
      }
    }

    public struct FindDocumentsByTeam: GraphQLSelectionSet {
      public static let possibleTypes = ["Document"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("doc_url", type: .nonNull(.scalar(String.self))),
        GraphQLField("user", type: .nonNull(.object(User.selections))),
        GraphQLField("folder", type: .object(Folder.selections)),
        GraphQLField("title", type: .nonNull(.scalar(String.self))),
        GraphQLField("textContent", type: .nonNull(.scalar(String.self))),
        GraphQLField("createdAt", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, docUrl: String, user: User, folder: Folder? = nil, title: String, textContent: String, createdAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Document", "id": id, "doc_url": docUrl, "user": user.resultMap, "folder": folder.flatMap { (value: Folder) -> ResultMap in value.resultMap }, "title": title, "textContent": textContent, "createdAt": createdAt])
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

      public var docUrl: String {
        get {
          return resultMap["doc_url"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "doc_url")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public var folder: Folder? {
        get {
          return (resultMap["folder"] as? ResultMap).flatMap { Folder(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "folder")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var textContent: String {
        get {
          return resultMap["textContent"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "textContent")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("profilePic", type: .scalar(String.self)),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, profilePic: String? = nil, id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "User", "name": name, "profilePic": profilePic, "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var profilePic: String? {
          get {
            return resultMap["profilePic"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "profilePic")
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
      }

      public struct Folder: GraphQLSelectionSet {
        public static let possibleTypes = ["Folder"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, title: String) {
          self.init(unsafeResultMap: ["__typename": "Folder", "id": id, "title": title])
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

        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }
      }
    }
  }
}