//
//  Protocal.swift
//  Protocal
//
//  Created by patururamesh on 06/11/24.
//


import UIKit

protocol Vehicle {
    var color: String { get set }
    var numberOfWheels: Int { get }
    func startEngine()
    func stopEngine()
}
class Car: Vehicle {
    var color: String
    var numberOfWheels: Int = 10
    
    init(color: String) {
        self.color = color
    }

    func startEngine() {
        print("Engine started")
    }

    func stopEngine() {
        print("Engine stopped")
    }
}



