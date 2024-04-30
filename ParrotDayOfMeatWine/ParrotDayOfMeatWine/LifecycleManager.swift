//
//  SingletonRace.swift
//  ParrotDayOfMeatWine
//
//  Created by Juan Manuel Moreno on 30/04/24.
//

import Foundation

final class LifecycleManager {
    
    static let shared: LifecycleManager = LifecycleManager()
    var aClock: AClock
    
    init() {
        aClock = AClock()
    }
}

class AClock {
    @Published var counter = [Int.random(in: 0...100), Int.random(in: 0...100), Int.random(in: 0...100)]
}
