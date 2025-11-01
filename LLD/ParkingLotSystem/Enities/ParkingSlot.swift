//
//  ParkingSlot.swift
//  LLD
//
//  Created by Khanduri, Namrata on 01/11/25.
//

import Foundation

class ParkingSlot {
    
    let queue = DispatchQueue(label: "Entity.ParkingSlot.Queue")
    let type: ParkingSlotType
    let id: String
    
    init(type: ParkingSlotType, id: String = UUID().uuidString) {
        self.type = type
        self.id = id
    }
    private var vehicle: Vehicle?
    
    func isAvailable() -> Bool {
        queue.sync {
            return vehicle == nil
        }
    }
    
    func parkedVehicle() -> Vehicle? {
        queue.sync {
            return vehicle
        }
    }
    
    func park(vehicle: Vehicle) throws {
        
        try queue.sync {
            if self.vehicle == nil {
                throw ParkingError.slotOccupied
            }

            if !self.isVehicleCompatible(with: vehicle.type) {
                throw ParkingError.incompatibleVehicle
            }

            self.vehicle = vehicle
            
        }
        
    }
    
    func vacate() {
        queue.async {
            self.vehicle = nil
        }
    }
    
    private func isVehicleCompatible(with type: VehicleType) -> Bool {
        switch (self.type, type) {
        case (.smallVehicle, .twoWheeler),
             (.mediumVehicle, .fourWheeler),
             (.heavyLoad, .truck):
            return true
        default:
            return false
        }
    }
    
}
