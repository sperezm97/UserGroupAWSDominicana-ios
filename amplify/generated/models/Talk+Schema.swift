// swiftlint:disable all
import Amplify
import Foundation

extension Talk {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case description
    case date
    case speaker
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let talk = Talk.keys
    
    model.pluralName = "Talks"
    
    model.fields(
      .id(),
      .field(talk.name, is: .required, ofType: .string),
      .field(talk.description, is: .optional, ofType: .string),
      .field(talk.date, is: .required, ofType: .string),
      .belongsTo(talk.speaker, is: .required, ofType: Speaker.self, targetName: "talkSpeakerId")
    )
    }
}