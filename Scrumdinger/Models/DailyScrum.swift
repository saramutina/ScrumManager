//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Katie Saramutina on 13.02.2023.
//

import Foundation

struct DailyScrum {
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var theme: Theme
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Hogwarts", attendees: ["Minerva", "Albus", "Severus", "Harry", "Hermionie", "Ron"], lengthInMinutes: 15, theme: .yellow),
        DailyScrum(title: "Jedi Order", attendees: ["Anakin", "Obi Van", "Yoda", "Chewbacca", "Padmé"], lengthInMinutes: 10, theme: .indigo),
        DailyScrum(title: "Cyberlife", attendees: ["Connor", "Markus", "Kara", "Luther", "Hank", "Carl"], lengthInMinutes: 15, theme: .seafoam)
    ]
}
