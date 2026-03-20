//
//  ParkingLotSystem.swift
//  LLD
//
//  Created by Khanduri, Namrata on 01/11/25.
//


class ParkingLotSystem {
    
    private let parkingLot: ParkingLot
    
    init(parkingLot: ParkingLot, parkingStrategy: ParkingStrategy) {
        self.parkingLot = parkingLot
        self.parkingStrategy = parkingStrategy
    }
    
    private var parkingStrategy: ParkingStrategy
    
    func setParkingStrategy(_ strategy: ParkingStrategy) {
        self.parkingStrategy = strategy
    }
    
    func parkVehicle(vehicle: Vehicle) throws -> ParkingSlot {
        try parkingStrategy.parkVehicle(vehicle)
    }
    
    func leaveVehicle(_ vehicle: Vehicle)  {
        
        parkingStrategy.unparkVehicle(vehicle)
    }
    
    
    
    
}
