//
//  BarRaceView.swift
//  ParrotDayOfMeatWine
//
//  Created by Juan Manuel Moreno on 30/04/24.
//

import SwiftUI

struct BarRaceView: View {
    
    var counter = 0
    
    init(counter: Int) {
        self.counter = counter
    }
    
    var body: some View {
        HStack{
            Rectangle()
                .frame(width: 98 + CGFloat(counter), height: 32, alignment: .leading)
                .foregroundColor(.blue)
                .animation(Animation.easeInOut(duration: 5), value: 0.0)
            Spacer()
        }
    }
}

#Preview {
    BarRaceView(counter: 0)
}
