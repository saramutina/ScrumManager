//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Katie Saramutina on 06.02.2023.
//

import SwiftUI

@main
struct ScrumManagerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: DailyScrum.sampleData)
            }
        }
    }
}
