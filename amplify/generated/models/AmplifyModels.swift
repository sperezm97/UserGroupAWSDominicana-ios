// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "116d75b5a434a92ee482582a192eb1e0"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Talk.self)
    ModelRegistry.register(modelType: Speaker.self)
  }
}