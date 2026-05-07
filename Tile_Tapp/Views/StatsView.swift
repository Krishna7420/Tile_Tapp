//
//  StatsView.swift
//  Tile_Tapp
//
//  Created by Shrikrishna Thodsare on 06/05/26.
//

import SwiftUI

struct StatisticsView: View {
    
    @AppStorage("highScore") var highScore = 0
    @AppStorage("gamesPlayed") var gamesPlayed = 0
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(
                colors: [.black, .purple],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 25) {
                
                Text("Statistics")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                
                statsCard(
                    title: "High Score",
                    value: "\(highScore)",
                    icon: "crown.fill",
                    color: .yellow
                )
                
                statsCard(
                    title: "Games Played",
                    value: "\(gamesPlayed)",
                    icon: "gamecontroller.fill",
                    color: .blue
                )
                
                Spacer()
            }
            .padding()
        }
    }
    
    func statsCard(
        title: String,
        value: String,
        icon: String,
        color: Color
    ) -> some View {
        
        HStack {
            
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundStyle(color)
            
            VStack(alignment: .leading) {
                
                Text(title)
                    .foregroundStyle(.white.opacity(0.7))
                
                Text(value)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            }
            
            Spacer()
        }
        .padding()
        .background(.white.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    StatisticsView()
}
