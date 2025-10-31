link: https://codezym.com/question/7

Write code for low level design of a parking lot with multiple floors.
The parking lot has two kinds of parking spaces: type = 2, for 2 wheeler vehicles and type = 4, for 4 wheeler vehicles.

There are multiple floors in the parking lot. On each floor, vehicles are parked in parking spots arranged in rows and columns.


Clear requirements:
1. will there be more type of vehicle in the future - YES
2. Is there ticket system as well - No for now
3. What functionality is required
park vehicle
remove vehicle
4. Is parking automatic or manual - both could be possible
5. How many parking lot a system can maintain - 1

Enities:

- Vehicle
- Vehicle type
- Floor
- ParkingSlot
- ParkingSlotState
- ParkingSlotType
- ParkingStrategy
- ParkingLotCenterSystem




Connections
- Vehicle 
    has vehicle type [Composition strong has - a relation]
    has id Int [unique id]
    has vehicle no - optional for bicycles or tricles 
    Entry time
    exit time
    
- Vehicle type enum

- ParkingSlotState 
    empty
    occupied(Vehicle)
    notAvailable ------ becuase of any reason

- ParkingSlotType
    small
    medium
    heavyLoad    
    
- struct ParkingSlotPosition
    row
    column

- ParkingSlot
    ParkingSlotState [Composition strong has - a relation]
    ParkingSlotType [Composition strong has - a relation]
    position : ParkingSlotPosition [Composition strong has - a relation]
    
- Floor
    slots: [[ParkingSlot]] - 2D matrix [Composition strong has - a relation]
    // or can be dictionary, get method for getting rows and column count
    availbleSlots()-> [ParkingSlot]
    
    

- AutomaticParkingStrategy [Strategy Pattern]
    func parkVehicle(vehicle) -> ParkingSlot
    
    
- AutomaticParkingStrategyNearestSlot
- AutomaticParkingStrategyFarthestSlot
- AutomaticParkingStrategyRandomSlot


- ManualParkingStrategy 
    func parkVehicle(vehicle, slot)


- enum ParkingStragtegy 
    automatic - strategy
    manual
    
    



- ParkingLotCenterSystem [FACADE]
    func addFloor(floor)
    func selectParkingStragegy(ParkingStragtegy)
    func parkVehicle(vehicle)
    func removevehicle(vehicle)
    
     
    
    
      

