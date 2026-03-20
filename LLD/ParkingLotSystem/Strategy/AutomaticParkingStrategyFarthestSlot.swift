//
//  AutomaticParkingStrategyFarthestSlot.swift
//  LLD
//
//  Created by Khanduri, Namrata on 01/11/25.
//


class AutomaticParkingStrategyFarthestSlot: ParkingStrategy {
    
    var parkingLot: ParkingLot
    
    init(parkingLot: ParkingLot) {
        self.parkingLot = parkingLot
    }
    
    func parkVehicle(_ vehicle: Vehicle) throws -> ParkingSlot {
        let floors = parkingLot.floors
        let availableSlot = floors.last(where: { $0.getVacantSlots().count > 0 })?.getVacantSlots().last
        guard let availableSlot else {
            throw ParkingError.noSpaceAvailable
        }
        return availableSlot
    }
    
    func unparkVehicle(from slot: ParkingSlot) {
        slot.vacate()
    }
}
