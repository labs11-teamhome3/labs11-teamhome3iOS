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

public final class TeamsByUserQuery: GraphQLQuery {
  public let operationDefinition =
    "query teamsByUser($userId: ID) {\n  teamsByUser(userId: $userId) {\n    __typename\n    id\n    teamName\n  }\n}"

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