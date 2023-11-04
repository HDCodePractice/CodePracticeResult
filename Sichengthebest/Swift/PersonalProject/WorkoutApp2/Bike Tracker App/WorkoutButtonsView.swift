//
//  WorkoutButtonsView.swift
//  Bike Tracker App
//
//  Created by Sicheng Jiang on 2023-11-04.
//

import SwiftUI
import MapKit

struct WorkoutButtons: View {
    @AppStorage("workouts") var workouts: [Workout] = []
    @Binding var isStarted: Bool
    @Binding var isRunning: Bool
    @Binding var userCoordinates: [CLLocationCoordinate2D]
    @Binding var progressTime: Int
    @Binding var distance: Double
    
    var body: some View {
        HStack {
            if isStarted {
                Button {
                    isRunning.toggle()
                } label: {
                    RectButtonView(text: isRunning ? "Pause":"Resume", image: isRunning ? "pause.fill" : "play.fill", color: isRunning ? .yellow : .green)
                        .frame(height: 30)
                }
                Button {
                    isStarted = false
                    isRunning = false
                    if distance > 0.0 {
                        workouts.append(Workout(time: progressTime,endDate:Date.now,speed:(distance / Double(progressTime))*3.6,distance:distance/1000,elevationGain: 0.0))
                        for coordinate in userCoordinates {
                            workouts[workouts.count-1].addCoordToArray(coord: coordinate)
                        }
                    }
                    userCoordinates = []
                    progressTime = 0
                    distance = 0.0
                } label: {
                    RectButtonView(text: "End", image: "xmark", color: .red)
                        .frame(height: 30)
                }
            } else {
                Button {
                    isStarted = true
                    isRunning = true
                } label: {
                    RectButtonView(text: "Start", image: "figure.outdoor.cycle", color: .blue)
                        .frame(height: 30)
                }
            }
        }
    }
}
