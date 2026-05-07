//
//  TileView.swift
//  Tile_Tapp
//
//  Created by Shrikrishna Thodsare on 06/05/26.
//
import SwiftUI

struct TileView: View {
    
    let tile: Tile
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 18)
                .fill(
                    LinearGradient(
                        colors: [
                            .black,
                            .gray.opacity(0.9)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            RoundedRectangle(cornerRadius: 18)
                .stroke(.white.opacity(0.1), lineWidth: 1)
            
            Image(systemName: "hand.tap.fill")
                .font(.title)
                .foregroundStyle(.white.opacity(0.8))
        }
        .frame(width: 80, height: 140)
        .shadow(color: .black.opacity(0.4),
                radius: 8,
                x: 0,
                y: 6)
        .scaleEffect(tile.isTapped ? 0.8 : 1)
        .animation(.spring(), value: tile.isTapped)
    }
}
