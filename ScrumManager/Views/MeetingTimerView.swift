//
//  MeetingTimerView.swift
//  ScrumManager
//
//  Created by Katie Saramutina on 14.03.2023.
//

import SwiftUI

struct MeetingTimerView: View {
    let speakers: [ScrumTimer.Speaker]
    let theme: Theme
    
    private var currentSpeaker: String {
        speakers.first(where: { !$0.finishedSpeaking })?.name ?? "Someone"
    }
    
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                VStack {
                    Text(currentSpeaker)
                        .font(.title)
                    Text("is speaking")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
            .overlay {
                ForEach(speakers) {speaker in
                    if speaker.finishedSpeaking, let index = speakers.firstIndex(where: { $0.id == speaker.id }) {
                        SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                            .rotation(Angle(degrees: -90))
                            .stroke(theme.mainColor, lineWidth: 12)
                    }
                }
            }
            .padding(.horizontal)
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    static var speakers: [ScrumTimer.Speaker] {
        [ScrumTimer.Speaker(name: "Mark", finishedSpeaking: true), ScrumTimer.Speaker(name: "John", finishedSpeaking: true), ScrumTimer.Speaker(name: "Katie", finishedSpeaking: false)]
    }
    
    static var previews: some View {
        MeetingTimerView(speakers: speakers, theme: .bubblegum)
    }
}
