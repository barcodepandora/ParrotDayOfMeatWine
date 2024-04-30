//
//  RaceView.swift
//  ParrotDayOfMeatWine
//
//  Created by Juan Manuel Moreno on 30/04/24.
//

import SwiftUI

struct RaceView: View {
    
    @State var thisIsAMan = LifecycleManager.shared.aClock.counter
    var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            BarRaceView(counter: thisIsAMan[0])
                .onReceive(timer) { _ in
                    thisIsAMan[0] = Int.random(in: 0...124)
                }
            BarRaceView(counter: thisIsAMan[1])
                .onReceive(timer) { _ in
                    thisIsAMan[1] = Int.random(in: 0...124)
                }
            BarRaceView(counter: thisIsAMan[2])
                .onReceive(timer) { _ in
                    thisIsAMan[2] = Int.random(in: 0...124)
                }
        }
    }
}

#Preview {
    RaceView()
}
