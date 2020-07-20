// swiftlint:disable all
import Amplify
import Foundation

extension Speaker {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case talks
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let speaker = Speaker.keys
    
    model.pluralName = "Speakers"
    
    model.fields(
      .id(),
      .field(speaker.name, is: .required, ofType: .string),
      .hasMany(speaker.talks, is: .optional, ofType: Talk.self, associatedWith: Talk.keys.speaker)
    )
    }
}