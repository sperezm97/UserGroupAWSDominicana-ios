// swiftlint:disable all
import Amplify
import Foundation

public struct Talk: Model {
  public let id: String
  public var name: String
  public var description: String?
  public var date: String
  public var speaker: Speaker
  
  public init(id: String = UUID().uuidString,
      name: String,
      description: String? = nil,
      date: String,
      speaker: Speaker) {
      self.id = id
      self.name = name
      self.description = description
      self.date = date
      self.speaker = speaker
  }
}