//
//  ParkingLotDemo.swift
//  LLD
//
//  Created by Khanduri, Namrata on 02/11/25.
//

import Foundation

class ParkingLotDemo {
    
    var parkingLotSystem: ParkingLotSystem!
    
    func run() throws {
                
        let floors = try parkingLotFloors()
        
        
        let parkingLot = ParkingLot(numberOfFloors: 3, floors: floors)
        
        var parkingStrategy: ParkingStrategy = ManualParkingStrategy(parkingLot: parkingLot)
        
        let parkingLotSystem = ParkingLotSystem(parkingLot: parkingLot, parkingStrategy: parkingStrategy)
        
        
        let firstVehicle = Vehicle(type: .twoWheeler, number: "AB", entryTime: Date())
        do {
            try parkingLotSystem.parkVehicle(vehicle: firstVehicle)
        } catch {
            // do manual select logic
//            switch error {
//            case ManualParkingSelectionError.slotNotSelected:
//                (parkingStrategy as! ManualParkingStrategy).selectSlot(slot: <#T##ParkingSlot#>)
//            }
        }
        
        parkingStrategy = AutomaticParkingStrategyFarthestSlot(parkingLot: parkingLot)
        let secondVehicle = Vehicle(type: .twoWheeler, number: "ed", entryTime: Date())

        let v2slot = try parkingLotSystem.parkVehicle(vehicle: secondVehicle)
        
        parkingLotSystem.leaveVehicle(secondVehicle)
        
    }
    
    func parkingLotFloors() throws -> [FloorProtocol] {
        let slot1Type = ParkingSlotType.smallVehicle
        let slot2Type = ParkingSlotType.mediumVehicle
        let slot3Type = ParkingSlotType.heavyLoad
        
        let layout: [[ParkingSlotType]] = [[slot1Type, slot2Type], [slot3Type, slot1Type]]

         
        let floor1: FloorProtocol = try Floor(row: 2, column: 2, floorNumber: 1, layout: layout)
        let floor2: FloorProtocol = try Floor(row: 2, column: 2, floorNumber: 1, layout: layout)
        let floor3: FloorProtocol = try Floor(row: 2, column: 2, floorNumber: 1, layout: layout)
        
        return [floor1, floor2, floor3]

    }
    
}
