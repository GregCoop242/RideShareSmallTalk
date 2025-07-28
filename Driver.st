"Driver.st"
Object subclass: Driver [
    | name id vehicleType vehicleNumber password rating assignedRides |

    initializeWithName: aName id: anID type: aType number: aNumber password: aPassword rating: aRating [
        name := aName.
        id := anID.
        vehicleType := aType.
        vehicleNumber := aNumber.
        password := aPassword.
        rating := aRating.
        assignedRides := OrderedCollection new.
    ]

    addRide: aRide [
        assignedRides add: aRide.
    ]

    displayInfo [
        Transcript show: 'Driver: ', name, ' (', id, ')'; cr.
        Transcript show: 'Vehicle: ', vehicleType, ' ', vehicleNumber; cr.
        Transcript show: 'Rating: ', rating printString; cr.
    ]

    name [ ^name ]
    password [ ^password ]
    id [ ^id ]
]