//
//  Floor.swift
//  LLD
//
//  Created by Khanduri, Namrata on 01/11/25.
//

protocol FloorProtocol {
    func getAvailableSlots() -> [ParkingSlot]
    func getVacantSlots() -> [ParkingSlot]
    func parkVehicle(vehicle: Vehicle, slotId: String) throws
}

class Floor: FloorProtocol {
    
    
    
    
    private var slots: [String:[ParkingSlot]] = [:]
    let floorNumber: Int
    let numberOfRows: Int
    let numberOfColumns: Int
    
    init(row: Int, column: Int, floorNumber: Int, layout: [[ParkingSlotType]]) throws {
        self.floorNumber = floorNumber
        self.numberOfRows = row
        self.numberOfColumns = column
        
        var indexRow = 0
        
        for i in 0..<row {
            
            for j in 0..<column {
                
                if layout.count < row {
                    throw FloorProtocolError.invalidInput("Invalid layout provided, rows are less than given")
                }
                if layout.first?.count ?? 0 < column {
                    throw FloorProtocolError.invalidInput("Invalid layout provided, Column are less than given")
                }
                let givenLayout = layout[row][column]
                
                let id = "F\(floorNumber)-R\(row)-C\(column)"
                let slot = ParkingSlot(type: givenLayout, id: id)
                
                if slots["\(i)"] != nil {
                    slots["\(i)"]?.append(slot)
                } else {
                    slots["\(i)"] = [slot]
                }
            }
            
        }
        
    }
    
    func getVacantSlots() -> [ParkingSlot] {
        
        var vacantSlots: [ParkingSlot] = []
        
        for (_, value) in slots {
            vacantSlots.append(contentsOf: value.filter { $0.isAvailable() })
        }
        
        return vacantSlots
        
    }
    
    func parkVehicle(vehicle: Vehicle, slotId: String) throws {
        
        let slot = getVacantSlots().first(where: { $0.id == slotId })
        if slot == nil {
            throw FloorProtocolError.slotNotAvailable
        }
        try slot?.park(vehicle: vehicle)
        
    }
    
    func getAvailableSlots() -> [ParkingSlot] {
        slots.flatMap { $0.value }
    }
    
}

enum FloorProtocolError: Error {
    case invalidInput(String)
    case slotNotAvailable
}
