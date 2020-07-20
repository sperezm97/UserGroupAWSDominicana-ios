// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "a05ebfa266c0037ba4b6ec906c4fe25d"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Speaker.self)
    ModelRegistry.register(modelType: Talk.self)
  }
}