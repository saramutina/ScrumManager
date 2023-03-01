//
//  ScrumTimer.swift
//  ScrumManager
//
//  Created by Katie Saramutina on 01.03.2023.
//

import Foundation

class ScrumTimer: ObservableObject {
    
    struct Speaker: Identifiable {
        let name: String
        var finishedSpeaking: Bool
        let id = UUID()
    }
    
    @Published var activeSpeaker = ""
    @Published var secondsElapsed = 0
    @Published var secondsRemaining = 0
    
    private(set) var speakers: [Speaker] = []
    /// Meeting length:
    private(set) var lengthInMinutes: Int
    
    var speakerChangedAction: (() -> Void)?
    
    private var timer: Timer?
    private var timerStopped: Bool = false
    private var frequency: TimeInterval {1.0 / 60.0}
    private var lengthInSeconds: Int { lengthInMinutes * 60 }
    private var secondsPerSpeaker: Int {
        (lengthInMinutes * 60) / speakers.count
    }
    private var secondsElapsedForSpeaker: Int = 0
    private var speakerIndex: Int = 0
    private var speakerText: String {
        return "Speaker \(speakerIndex + 1): " + speakers[speakerIndex].name
    }
    private var startDate: Date?
    
    /// Initializing with no arguments initializes Timer with no speakers and zero length
    init(lengthInMinutes: Int = 0, attendees: [DailyScrum.Attendee] = []) {
        self.lengthInMinutes = lengthInMinutes
        self.speakers = attendees.speakers
        secondsRemaining = lengthInSeconds
        activeSpeaker = speakerText
    }
    
    // Reset timer with new time and attendees:
    func reset(lengthInMinutes: Int, attendees: [DailyScrum.Attendee]) {
        self.lengthInMinutes = lengthInMinutes
        self.speakers = attendees.speakers
        secondsRemaining = lengthInSeconds
        activeSpeaker = speakerText
    }
    
    // Start the timer:
    func startScrum() {
        changeToSpeaker(at: 0)
    }
    
    // Stop the timer:
    func stopScrum() {
        timer?.invalidate()
        timer = nil
        timerStopped = true
    }
    
    // Skip to next speaker:
    func skipSpeaker() {
        changeToSpeaker(at: speakerIndex + 1)
    }
    
    private func changeToSpeaker(at index: Int) {
        if index > 0 {
            let previousSpeakerIndex = index - 1
            speakers[previousSpeakerIndex].finishedSpeaking = true
        }
        secondsElapsedForSpeaker = 0
        
        guard index < speakers.count else { return }
        speakerIndex = index
        activeSpeaker = speakerText
        
        secondsElapsed = index * secondsPerSpeaker
        secondsRemaining = lengthInSeconds - secondsElapsed
        startDate = Date()
        timer = Timer.scheduledTimer(withTimeInterval: frequency, repeats: true) { [weak self] timer in
            if let self = self, let startDate = self.startDate {
                let secondsElapsed = Date().timeIntervalSince1970 - startDate.timeIntervalSince1970
                self.update(secondsElapsed: Int(secondsElapsed))
            }
        }
    }
    
    private func update(secondsElapsed: Int) {
        secondsElapsedForSpeaker = secondsElapsed
        self.secondsElapsed = secondsPerSpeaker * speakerIndex + secondsElapsedForSpeaker
        
        guard secondsElapsed <= secondsPerSpeaker else { return }
        secondsRemaining = max(lengthInSeconds - self.secondsElapsed, 0)
        
        guard !timerStopped else { return }
        if secondsElapsedForSpeaker >= secondsPerSpeaker {
            changeToSpeaker(at: speakerIndex + 1)
            speakerChangedAction?()
        }
    }
    
}

extension DailyScrum {
    // ScrumTimer that uses time and attendee list from DailyScrum
    var timer: ScrumTimer {
        ScrumTimer(lengthInMinutes: lengthInMinutes, attendees: attendees)
    }
}

// Turn attendee into speaker (to keep track of doneSpeaking attribute):
extension Array where Element == DailyScrum.Attendee {
    var speakers: [ScrumTimer.Speaker] {
        if isEmpty {
            /// placeholder if there are no speakers
            return [ScrumTimer.Speaker(name: "Speaker 1", finishedSpeaking: false)]
        } else {
            return map {
                ScrumTimer.Speaker(name: $0.name, finishedSpeaking: false)
            }
        }
    }
}
