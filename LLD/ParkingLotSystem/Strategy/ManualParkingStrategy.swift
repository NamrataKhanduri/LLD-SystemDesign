//
//  ManualParkingStrategy.swift
//  LLD
//
//  Created by Khanduri, Namrata on 01/11/25.
//

class ManualParkingStrategy: ParkingStrategy {
    
    
    var parkingLot: ParkingLot
    var selectedSlotToPark: ParkingSlot?
    
    
    init(parkingLot: ParkingLot) {
        
        self.parkingLot = parkingLot
    }
    
    
    
    func selectSlot( slot: ParkingSlot) throws  {
        if !slot.isAvailable() {
            throw ParkingError.slotOccupied
        }
        selectedSlotToPark = slot
    }
    
    func parkVehicle(_ vehicle: Vehicle) throws -> ParkingSlot {
 
        if selectedSlotToPark == nil {
            throw ManualParkingSelectionError.slotNotSelected
        }
        
        try selectedSlotToPark?.park(vehicle: vehicle)
        let slot = selectedSlotToPark!
        selectedSlotToPark = nil
        return slot
    }
    
    func unparkVehicle(from slot: ParkingSlot) {
        slot.vacate()
    }
    
}
