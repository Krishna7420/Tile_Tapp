//
//  HomeView.swift
//  Tile_Tapp
//
//  Created by Shrikrishna Thodsare on 06/05/26.
//

import SwiftUI

struct HomeView: View {
    
    @State private var animate = false
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                // MARK: Background
                
                LinearGradient(
                    colors: [
                        .black,
                        .purple,
                        .blue
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                // MARK: Floating Circles
                
                Circle()
                    .fill(.white.opacity(0.1))
                    .frame(width: 250)
                    .blur(radius: 10)
                    .offset(x: animate ? -120 : -80,
                            y: animate ? -300 : -250)
                    .animation(
                        .easeInOut(duration: 4)
                        .repeatForever(autoreverses: true),
                        value: animate
                    )
                
                Circle()
                    .fill(.purple.opacity(0.2))
                    .frame(width: 300)
                    .blur(radius: 20)
                    .offset(x: animate ? 120 : 80,
                            y: animate ? 250 : 200)
                    .animation(
                        .easeInOut(duration: 5)
                        .repeatForever(autoreverses: true),
                        value: animate
                    )
                
                VStack(spacing: 35) {
                    
                    Spacer()
                    
                    // MARK: App Logo
                    
                    VStack(spacing: 15) {
                        
                        Image(systemName: "square.grid.2x2.fill")
                            .font(.system(size: 60))
                            .foregroundStyle(.blue)
                            .animation(
                                .easeInOut(duration: 5),
                                value: animate
                            )
                        
                        Text("Tiles Tapp")
                            .font(.system(size: 42,
                                          weight: .heavy,
                                          design: .rounded))
                            .foregroundStyle(.white)
                        
                        Text("Tap Fast. Stay Focused.")
                            .foregroundStyle(.white.opacity(0.7))
                    }
                    
                    Spacer()
                    
                    // MARK: Buttons
                    
                    VStack(spacing: 20) {
                        
                        NavigationLink {
                            GameView()
                        } label: {
                            MenuButton(
                                title: "New Game",
                                icon: "play.fill",
                                color: .blue
                            )
                        }
                        
                        NavigationLink {
                            StatisticsView()
                        } label: {
                            MenuButton(
                                title: "Statistics",
                                icon: "chart.bar.fill",
                                color: .purple
                            )
                        }
                    }
                    .padding(.horizontal, 30)
                    
                    Spacer()
                }
            }
            .onAppear {
                animate = true
            }
        }
    }
}

#Preview {
    HomeView()
}
