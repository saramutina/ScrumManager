//
//  MeetingFooterView.swift
//  ScrumManager
//
//  Created by Katie Saramutina on 01.03.2023.
//

import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    var skipAction: () -> Void
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: {
            !$0.finishedSpeaking
        }) else { return nil }
        return index + 1
    }
    // Checks if the active speaker is the last one
    private var isLastSpeaker: Bool {
        /// dropLasts helps check if everyone but the last person has finished speaking
        speakers.dropLast().allSatisfy { $0.finishedSpeaking }
    }
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers" }
        if isLastSpeaker {
            return "Last speaker"
        } else {
            return "Speaker \(speakerNumber) of \(speakers.count)"
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text(speakerText)
                } else {
                    Text(speakerText)
                    Spacer()
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
            .previewLayout(.sizeThatFits)
    }
}
