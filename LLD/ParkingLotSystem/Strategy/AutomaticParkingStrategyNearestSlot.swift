//
//  AutomaticParkingStrategyNearestSlot.swift
//  LLD
//
//  Created by Khanduri, Namrata on 01/11/25.
//

class AutomaticParkingStrategyNearestSlot: ParkingStrategy {
    
    var parkingLot: ParkingLot
    
    init(parkingLot: ParkingLot) {
        self.parkingLot = parkingLot
    }
    
    func parkVehicle(_ vehicle: Vehicle) throws -> ParkingSlot {
        let floors = parkingLot.floors
        let availableSlot = floors.first(where: { $0.getVacantSlots().count > 0 })?.getVacantSlots().first
        guard let availableSlot else {
            throw ParkingError.noSpaceAvailable
        }
        return availableSlot
    }
    
    func unparkVehicle(from slot: ParkingSlot) {
        slot.vacate()
    }
}
