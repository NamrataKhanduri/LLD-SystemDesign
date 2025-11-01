//
//  ParkingLot.swift
//  LLD
//
//  Created by Khanduri, Namrata on 01/11/25.
//

class ParkingLot {
    
    var numberOfFloors: Int
    var floors: [FloorProtocol] = []
    
    
    init(numberOfFloors: Int, floors: [FloorProtocol]) {
        self.numberOfFloors = numberOfFloors
        self.floors = floors
    }
        
}
