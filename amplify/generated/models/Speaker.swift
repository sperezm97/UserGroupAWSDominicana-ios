// swiftlint:disable all
import Amplify
import Foundation

public struct Speaker: Model {
  public let id: String
  public var name: String
  public var talks: List<Talk>?
  
  public init(id: String = UUID().uuidString,
      name: String,
      talks: List<Talk>? = []) {
      self.id = id
      self.name = name
      self.talks = talks
  }
}