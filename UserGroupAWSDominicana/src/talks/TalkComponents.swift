//
//  talkComponents.swift
//  cuantoes?
//
//  Created by Shailyn javier Ortiz jimenez on 6/29/20.
//  Copyright © 2020 Shailyn javier Ortiz jimenez. All rights reserved.
//

import Foundation
import SwiftUI
import Amplify


struct TalkItem: View {

    var talkItem: Talk

    var body: some View {
        return HStack(alignment: .center){
            Text(talkItem.name)
                        .fontWeight(.semibold)
                    Spacer()
            if talkItem.speaker != nil {
                Text(talkItem.speaker!.name)
            }
        }
        .padding()
        .foregroundColor(Color(.black))
    }
}

func strToDate(talkItem: Talk) -> Date? {
    if talkItem.date != "" {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let date = dateFormatter.date(from: talkItem.date)
        return date
    }
    return nil
}

// -----------------------------
// Talks logic
// -----------------------------

func CreateTalk(name: String, description: String, date: String, speaker: Speaker) {
    let talk = Talk(
        name: name,
        description: description,
        date: date,
        speaker: speaker
    )

    _ = Amplify.API.mutate(request: .create(talk)) { event in
        switch event {
        case .success(let result):
            switch result {
            case .success(let talk):
                print("talk created: \(talk)")
            case .failure(let error):
               print("\n Got failed result with \(error.errorDescription)")
            }
        case .failure(let error):
            print("Got failed event with error \(error)")
        }
    }
}

func listTalks(name: String="") -> [Talk] {
    print("Executing list talks")
    let group = DispatchGroup()
    var talks = [Talk]()
    let talk = Talk.keys
    group.enter()
    var predicate = talk.name == name
    if name == "" {
        predicate = talk.name != name
    }
    
    DispatchQueue.global().async {
        _ = Amplify.API.query(request: .list(Talk.self, where: predicate)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let data):
                    talks = data
                case .failure(let error):
                    print("fail \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
            group.leave()
        }
    }
    group.wait()
    return talks
}

// -----------------------------
// Speaker logic
// -----------------------------

func CreateSpeaker(name: String) -> [Speaker] {
    let group = DispatchGroup()
    var speaker = [Speaker]()
    group.enter()
    DispatchQueue.global().async {
        _ = Amplify.API.mutate(request: .create(Speaker(name: name))){ event in
            switch(event) {
            case .success(let result):
                switch(result){
                case .success(let data):
                    speaker = [data]
                case .failure(let error):
                    print("failure: \(error)")
                }
                group.leave()
            case .failure(let error):
                print("failure \(error)")
                group.leave()
            }
        }
    }
    group.wait()
    return speaker
}

func listSpeakers(name: String="") -> [Speaker] {
    let group = DispatchGroup()
    let speaker = Speaker.keys
    var predicate = speaker.name == name
    if name == "" {
        predicate = speaker.name != name
    }
    var speakers = [Speaker]()

    group.enter()
    
    DispatchQueue.global().async {
        _ = Amplify.API.query(request: .list(Speaker.self, where: predicate)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let data):
                    speakers = data
                case .failure(let error):
                    print("fail \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
            group.leave()
        }
    }
    group.wait()
    
    return speakers
}

