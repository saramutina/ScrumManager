//
//  HistoryView.swift
//  ScrumManager
//
//  Created by Katie Saramutina on 20.03.2023.
//

import SwiftUI

struct HistoryView: View {
    let history: History
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Attendees")
                    .font(.headline)
                Text(history.attendeeString)
                if let transcript = history.transcript {
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                    Text(transcript)
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

extension History {
    var attendeeString: String {
        ListFormatter.localizedString(byJoining: attendees.map { $0.name } )
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var history = History(attendees: [DailyScrum.Attendee(name: "Adam"), DailyScrum.Attendee(name: "Eve"), DailyScrum.Attendee(name: "Steve")], lengthInMinutes: 10, transcript: "Eve, would you like to talk about a tree that you found yesterday? Yes, sure, it was an apple tree actually...")
    static var previews: some View {
        HistoryView(history: history)
    }
}
