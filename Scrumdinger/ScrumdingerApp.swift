//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Katie Saramutina on 06.02.2023.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
