//
//  ContentView.swift
//  Tile_Tapp
//
//  Created by Shrikrishna Thodsare on 06/05/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = GameViewModel()
    
    private let columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        ZStack {
            
            // 🌌 Background
            LinearGradient(
                colors: [.black, .purple, .blue],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                // 🔙 Top Bar
                HStack {
                    
                    Spacer()
                    
                    Text("Score: \(vm.score)")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    // placeholder for symmetry
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 40, height: 40)
                }
                .padding(.horizontal)
                
                Spacer()
                
                // 🎮 Grid
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(vm.tiles) { tile in
                        TileView(tile: tile)
                            .onTapGesture {
                                vm.tapTile(tile)
                            }
                    }
                }
                .padding()
                
                Spacer()
                
                // ▶️ Start Button
                Button(action: {
                    vm.resumeGame()
                }) {
                    Text("START GAME")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white.opacity(0.2))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
            }
        }
        .alert("Game Over", isPresented: $vm.isGameOver) {
            Button("Play Again") {
                vm.resumeGame()
            }
        } message: {
            Text("Final Score: \(vm.score)")
        }
    }
}
