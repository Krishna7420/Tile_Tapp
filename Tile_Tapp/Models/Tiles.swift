//
//  Tiles.swift
//  Tile_Tapp
//
//  Created by Shrikrishna Thodsare on 06/05/26.
//

import Foundation

struct Tile: Identifiable {
    
    let id = UUID()
    
    let column: Int
    
    var yPosition: CGFloat
    
    var isTapped: Bool = false
}
