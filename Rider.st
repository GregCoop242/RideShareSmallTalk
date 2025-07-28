"Rider.st"
Object subclass: Rider [
    | name id password requestedRides |

    initializeWithName: aName id: anID password: aPassword [
        name := aName.
        id := anID.
        password := aPassword.
        requestedRides := OrderedCollection new.
    ]

    requestRideFrom: drivers premium: isPremium pickUp: pickUp dropOff: dropOff [
        | driver rideClass ride |
        driver := drivers atRandom.
        rideClass := isPremium ifTrue: [PremiumRide] ifFalse: [StandardRide].
        ride := rideClass new.
        ride initializeWithID: 'ride', (requestedRides size + 1) printString
            pickUp: pickUp
            dropOff: dropOff
            distance: 10
            duration: 15.
        requestedRides add: ride.
        driver addRide: ride.
        ^ ride
    ]

    name [ ^name ]
    password [ ^password ]
    id [ ^id ]
]