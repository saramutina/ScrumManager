//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Katie Saramutina on 06.02.2023.
//

import SwiftUI

@main
struct ScrumManagerApp: App {
    
    @StateObject private var store = ScrumStore()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $store.scrums) {
                    Task {
                        do {
                            try await ScrumStore.save(scrums: store.scrums)
                        } catch {
                            fatalError("Error saving scrums.")
                        }
                    }
                }
            }
            .task {
                do {
                    store.scrums = try await ScrumStore.load()
                } catch {
                    fatalError("Error saving scrums.")
                }
            }
        }
    }
    
}
