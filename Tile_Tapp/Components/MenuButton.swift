//
//  MenuButton.swift
//  Tile_Tapp
//
//  Created by Shrikrishna Thodsare on 06/05/26.
//

import SwiftUI

struct MenuButton: View {
    
    let title: String
    let icon: String
    let color: Color
    
    var body: some View {
        
        HStack(spacing: 15) {
            
            Image(systemName: icon)
                .font(.title2)
            
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.headline)
        }
        .foregroundStyle(.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                colors: [
                    color.opacity(0.8),
                    color
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .shadow(color: color.opacity(0.4),
                radius: 10,
                x: 0,
                y: 5)
    }
}
