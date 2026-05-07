//
//  GameViewModel.swift
//  Tile_Tapp
//
//  Created by Shrikrishna Thodsare on 06/05/26.
//

import Foundation
import SwiftUI
import Combine

final class GameViewModel: ObservableObject {
    
    // MARK: Published Properties
    
    @Published var tiles: [Tile] = []
    
    @Published var score = 0
    
    @Published var isGameOver = false
    
    @Published var isPaused = false
    
    // MARK: Game Properties
    
    var timer: Timer?
    
    let columns = 4
    
    let tileSpeed: CGFloat = 6
    
    // MARK: Init
    
    init() {
        startGame()
    }
    
    // MARK: Start Game
    
    func startGame() {
        
        // Stop old timer
        
        timer?.invalidate()
        
        // Reset game state
        
        tiles.removeAll()
        
        score = 0
        
        isGameOver = false
        
        isPaused = false
        
        // Spawn first tile
        
        spawnTile()
        
        // Start game loop
        
        timer = Timer.scheduledTimer(
            withTimeInterval: 0.016,
            repeats: true
        ) { _ in
            
            self.updateTiles()
        }
    }
    
    // MARK: Spawn Tile
    
    func spawnTile() {
        
        let randomColumn = Int.random(in: 0..<columns)
        
        let tile = Tile(
            column: randomColumn,
            yPosition: -150
        )
        
        tiles.append(tile)
    }
    
    // MARK: Update Tiles
    
    func updateTiles() {
        
        // Move tiles downward
        
        for index in tiles.indices {
            tiles[index].yPosition += tileSpeed
        }
        
        // Check ALL tiles for game over
        
        for tile in tiles {
            
            if tile.yPosition > 900 &&
                !tile.isTapped {
                
                gameOver()
                
                return
            }
        }
        
        // Remove off-screen tapped tiles
        
        tiles.removeAll {
            $0.yPosition > 950
        }
        
        // Spawn new tiles
        
        if Int.random(in: 0...100) < 3 {
            spawnTile()
        }
    }
    
    func tapTile(_ tile: Tile) {
        
        guard let index = tiles.firstIndex(where: {
            $0.id == tile.id
        }) else {
            return
        }
        
        // Prevent double tap
        
        if tiles[index].isTapped {
            return
        }
        
        // Mark tapped
        
        tiles[index].isTapped = true
        
        // Increase score
        
        score += 1
        
        // Remove tile
        
        tiles.remove(at: index)
    }
    
    // MARK: Pause Game
    
    func pauseGame() {
        
        isPaused = true
        
        timer?.invalidate()
    }
    
    // MARK: Resume Game
    
    func resumeGame() {
        
        isPaused = false
        
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(
            withTimeInterval: 0.016,
            repeats: true
        ) { _ in
            
            self.updateTiles()
        }
    }
    
    // MARK: Game Over
    
    func gameOver() {
        
        timer?.invalidate()
        
        isGameOver = true
    }
}
