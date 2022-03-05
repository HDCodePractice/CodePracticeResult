//
//  Button.swift
//  WorldTimeList
//
//  Created by Jaden Cheung on 2/28/22.
//


import SwiftUI

struct TimeItemView: View {
    var time : String
    var hours : String
    var title : String
    var checker : Int

    
    var body: some View {
        VStack{
            HStack{
                
                VStack{
                    HStack{
                        Text(hours)
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    HStack{
                        Text(title)
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                        Spacer()
                    }

                
                }
                Spacer()
                
                Text(time)
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                if 11 + checker >= 24 || 11 + checker < 12{
                    Text("AM")
                        .foregroundColor(.white)
                }else{
                    Text("PM")
                        .foregroundColor(.white)
                }
            }
            Divider().background(Color.white)
            
        }
        
        
        
    }
}

