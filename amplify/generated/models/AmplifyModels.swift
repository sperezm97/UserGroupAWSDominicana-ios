// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "20988b08a85368e25c16660b8b7075c1"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Talk.self)
  }
}