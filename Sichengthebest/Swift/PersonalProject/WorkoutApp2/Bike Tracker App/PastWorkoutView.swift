//
//  PastWorkoutView.swift
//  Bike Tracker App
//
//  Created by Sicheng Jiang on 2023-10-14.
//

import SwiftUI
import MapKit

struct PastWorkoutView: View {
    @AppStorage("workouts") var workouts: [Workout] = []
    var count = 0
    
    var body: some View {
        if workouts.count == 0 {
            Text("There is no workout to display. Please go to \"Start a workout \" to start recording workouts.")
        } else {
            ForEach(workouts) { workout in
                NavigationLink {
                    HistoryView(workout: workout)
                } label: {
                    // Rectangular text displaying each workout
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 40)
                            .foregroundColor(.blue)
                        HStack {
                            Text("\(workout.endDate,style: .date)")
                                .foregroundColor(.black)
                                .font(.system(size: 17))
                            Text("\(String(format: "%.2f",workout.distance)) km")
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                            Image(systemName: "trash")
                                .onTapGesture {
                                    workouts.removeAll { element in
                                        return element == workout
                                    }
                                }
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }
}

struct HistoryView: View {
    var workout: Workout
    var body: some View {
        VStack {
            Label("Workout Time: \(Stopwatch(progressTime: workout.time))",systemImage: "stopwatch")
            Label("Distance: \(String(format: "%.2f",workout.distance)) km",systemImage: "figure.outdoor.cycle")
            Label("Avg. Speed: \(String(format: "%.1f",workout.speed)) kph",systemImage: "speedometer")
            Map {
                MapPolyline(coordinates:decodeArray(array: workout.coordArray))
                    .stroke(.blue, lineWidth: 5)
            }
        }
    }
}

func decodeArray(array: [[Double]]) -> [CLLocationCoordinate2D] {
    var newArray: [CLLocationCoordinate2D] = []
    for coord in array {
        newArray.append(CLLocationCoordinate2D(latitude: coord[0], longitude: coord[1]))
    }
    return newArray
}

#Preview {
    PastWorkoutView()
}
