//  This file was automatically generated and should not be edited.

import Apollo

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
