//
//  ParkingStrategy.swift
//  LLD
//
//  Created by Khanduri, Namrata on 01/11/25.
//

protocol ParkingStrategy {
    
    var parkingLot: ParkingLot {get set}
    
    func parkVehicle(_ vehicle: Vehicle) throws ->  ParkingSlot
    func unparkVehicle(from slot: ParkingSlot)
    func unparkVehicle(_ vehicle: Vehicle)

}


extension ParkingStrategy {
    
    func unparkVehicle(_ vehicle: Vehicle) {
        let a = parkingLot.floors.map { $0.getAvailableSlots() }.flatMap { $0 }
        let slot = a.filter({ $0.parkedVehicle()?.id == vehicle.id }).first
        slot?.vacate()
    }
}
