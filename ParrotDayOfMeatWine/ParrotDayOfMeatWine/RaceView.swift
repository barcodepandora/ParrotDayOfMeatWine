//
//  RaceView.swift
//  ParrotDayOfMeatWine
//
//  Created by Juan Manuel Moreno on 30/04/24.
//

import SwiftUI

struct RaceView: View {
    
    @State var theseAreTheLimit = LifecycleManager.shared.aClock.x
    @State var theseAreTheRemain = [0, 0, 0]
    @State var theseAreTheCounter = [0, 0, 0]
    let AConstantForAnimation = 100.0
    var indices = [0, 1, 2]
    let thisIsARange = 0...182
    var timerBarRace = Timer.publish(every: (1 / 100), on: .main, in: .common).autoconnect()
    var timerRequest = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
//    var timerBarRace: Timer.TimerPublisher
//    var timerRequest: Timer.TimerPublisher

//    init () {
//        timerBarRace = Timer.publish(every: (1 / AConstantForAnimation), on: .main, in: .common)
//        timerBarRace.autoconnect()
//        timerRequest = Timer.publish(every: 2, on: .main, in: .common)
//        timerRequest.autoconnect()
//    }
    
    
    var body: some View {
        VStack {
            ForEach(indices, id: \.self) { indice in
                BarRaceView(counter: theseAreTheCounter[indice])
                    .onReceive(timerRequest) { _ in
                        let thisIsANewLimit = Int.random(in: 0...182)
                        theseAreTheRemain[indice] = thisIsANewLimit - theseAreTheLimit[indice]
                        theseAreTheLimit[indice] = thisIsANewLimit
                    }
                    .onReceive(timerBarRace) { _ in
                        theseAreTheCounter[indice] += (theseAreTheRemain[indice] / Int(AConstantForAnimation))
                    }
            }
        }
    }
}

#Preview {
    RaceView()
}
