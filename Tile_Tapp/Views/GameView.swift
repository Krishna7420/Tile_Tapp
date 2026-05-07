//
//  Untitled.swift
//  Tile_Tapp
//
//  Created by Shrikrishna Thodsare on 06/05/26.
//

import SwiftUI

struct GameView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var vm = GameViewModel()
    
    
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        
        ZStack {
            
            // MARK: Background
            
            LinearGradient(
                colors: [
                    .black,
                    .blue.opacity(0.7)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // MARK: Lanes
            
            HStack(spacing: 0) {
                
                ForEach(0..<4) { _ in
                    
                    Rectangle()
                        .fill(.white.opacity(0.03))
                        .overlay(
                            Rectangle()
                                .stroke(.white.opacity(0.05), lineWidth: 1)
                        )
                }
            }
            .ignoresSafeArea()
            
            // MARK: Score
            
            VStack {
                
                // MARK: Top Bar
                
                HStack {
                    
                    // Quit Button
                    
                    Button {
                        
                        dismiss()
                        
                    } label: {
                        
                        Image(systemName: "xmark")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(width: 42, height: 42)
                            .background(.red.opacity(0.9))
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    // Score
                    
                    VStack(spacing: 2) {
                        
                        Text("SCORE")
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.7))
                        
                        Text("\(vm.score)")
                            .font(.system(size: 34,
                                          weight: .heavy,
                                          design: .rounded))
                            .foregroundStyle(.white)
                    }
                    
                    Spacer()
                    
                    // Pause / Resume
                    
                    Button {
                        
                        if vm.isPaused {
                            vm.resumeGame()
                        } else {
                            vm.pauseGame()
                        }
                        
                    } label: {
                        
                        Image(systemName:
                                vm.isPaused
                              ? "play.fill"
                              : "pause.fill")
                        
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 42, height: 42)
                        .background(.blue.opacity(0.9))
                        .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.top, 55)
                
                Spacer()
            }
            .zIndex(100)
            
            // MARK: Tiles
            
            ForEach(vm.tiles) { tile in
                
                TileView(tile: tile)
                    .position(
                        x: xPosition(for: tile.column),
                        y: tile.yPosition
                    )
                    .onTapGesture {
                        vm.tapTile(tile)
                    }
            }
        }
        .navigationBarBackButtonHidden()
        .alert("Game Over",
               isPresented: $vm.isGameOver) {
            
            Button("Play Again") {
                
                vm.isGameOver = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    
                    vm.startGame()
                }
            }
            
        } message: {
            
            Text("Final Score: \(vm.score)")
        }    }
    
    func xPosition(for column: Int) -> CGFloat {
        
        let tileWidth = screenWidth / 4
        
        return tileWidth * CGFloat(column) + tileWidth / 2
    }
}
