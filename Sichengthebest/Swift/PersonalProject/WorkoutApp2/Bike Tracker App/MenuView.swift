//
//  MenuView.swift
//  Bike Tracker App
//
//  Created by Sicheng Jiang on 2023-10-14.
//

import SwiftUI
import MapKit

struct MenuView: View {
    @State var position: MapCameraPosition = .userLocation(fallback: .automatic)
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    WorkoutView()
                } label: {
                    VStack {
                        RectButtonView(text: "Start a workout",image:"bicycle.circle", color: .green)
                            .frame(height:30)
                        Map(position:$position)
                    }
                    
                }
                .padding()
                // Previous workouts button
                NavigationLink {
                    PastWorkoutView()
                } label: {
                    RectButtonView(text: "View your previous workouts",image:"clock.arrow.circlepath", color: .blue)
                        .frame(height:30)
                }
                .padding()
            }
        }
    }
}

#Preview {
    MenuView()
}

struct RectButtonView: View {
    var text: String
    var image: String
    var color: Color
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(color)
            HStack {
                Image(systemName: image)
                    .foregroundColor(.black)
                Text(text)
                    .foregroundColor(.black)
            }
            .padding()
        }
    }
}
