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
    "query CurrentUser($authId: String) {\n  user(authId: $authId) {\n    __typename\n    id\n    createdAt\n    authId\n    name\n  }\n}"

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
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, createdAt: String? = nil, authId: String? = nil, name: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "createdAt": createdAt, "authId": authId, "name": name])
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
    }
  }
}

public final class FindMessagesByTeamQuery: GraphQLQuery {
  public let operationDefinition =
    "query FindMessagesByTeam($teamId: ID!) {\n  team(id: $teamId) {\n    __typename\n    id\n    teamName\n    members {\n      __typename\n      name\n      profilePic\n      id\n    }\n    messages {\n      __typename\n      content\n      images\n      id\n      comments {\n        __typename\n        createdAt\n        id\n        content\n      }\n      subscribedUsers {\n        __typename\n        name\n        profilePic\n      }\n      createdAt\n    }\n    tags {\n      __typename\n      name\n      id\n    }\n  }\n}"

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
          GraphQLField("images", type: .list(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("comments", type: .list(.object(Comment.selections))),
          GraphQLField("subscribedUsers", type: .list(.object(SubscribedUser.selections))),
          GraphQLField("createdAt", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(content: String, images: [String?]? = nil, id: GraphQLID, comments: [Comment?]? = nil, subscribedUsers: [SubscribedUser?]? = nil, createdAt: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Message", "content": content, "images": images, "id": id, "comments": comments.flatMap { (value: [Comment?]) -> [ResultMap?] in value.map { (value: Comment?) -> ResultMap? in value.flatMap { (value: Comment) -> ResultMap in value.resultMap } } }, "subscribedUsers": subscribedUsers.flatMap { (value: [SubscribedUser?]) -> [ResultMap?] in value.map { (value: SubscribedUser?) -> ResultMap? in value.flatMap { (value: SubscribedUser) -> ResultMap in value.resultMap } } }, "createdAt": createdAt])
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