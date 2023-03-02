//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Katie Saramutina on 13.02.2023.
//

import Foundation

struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    var history: [History] = []
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

extension DailyScrum {
    struct Attendee: Identifiable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    struct Data {
        var title: String = ""
        var attendees: [Attendee] = []
        var lengthInMinutes: Double = 10
        var theme: Theme = .lavender
    }
    
    var data: Data {
        Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), theme: theme)
    }
    
    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
    }
    
    init(data: Data) {
        self.id = UUID()
        self.title = data.title
        self.attendees = data.attendees
        self.lengthInMinutes = Int(data.lengthInMinutes)
        self.theme = data.theme
    }
}

// MARK: Sample data
extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Hogwarts", attendees: ["Minerva", "Albus", "Severus", "Harry", "Hermionie", "Ron", "Salazar", "Helga", "Rowena", "Godric"], lengthInMinutes: 10, theme: .yellow),
        DailyScrum(title: "Jedi Order", attendees: ["Anakin", "Obi Van", "Yoda", "Chewbacca", "Padmé"], lengthInMinutes: 10, theme: .indigo),
        DailyScrum(title: "Cyberlife", attendees: ["Connor", "Markus", "Kara", "Luther", "Hank", "Carl"], lengthInMinutes: 15, theme: .seafoam)
    ]
}
