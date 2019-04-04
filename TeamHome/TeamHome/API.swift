//  This file was automatically generated and should not be edited.

import Apollo

public final class CurrentUserQuery: GraphQLQuery {
  public let operationDefinition =
    "query CurrentUser($authId: String, $id: ID) {\n  user(authId: $authId, id: $id) {\n    __typename\n    id\n    createdAt\n    authId\n    name\n  }\n}"

  public var authId: String?
  public var id: GraphQLID?

  public init(authId: String? = nil, id: GraphQLID? = nil) {
    self.authId = authId
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["authId": authId, "id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("user", arguments: ["authId": GraphQLVariable("authId"), "id": GraphQLVariable("id")], type: .nonNull(.object(User.selections))),
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