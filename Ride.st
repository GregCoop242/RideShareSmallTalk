"Ride.st"
Object subclass: Ride [
    | rideID pickUpLocation dropOffLocation rideDistance rideDuration rideFare |

    Ride class >> newWithID: anID pickUp: pickUp dropOff: dropOff distance: distance duration: duration [
        | obj |
        obj := self new.
        obj initializeWithID: anID pickUp: pickUp dropOff: dropOff distance: distance duration: duration.
        ^obj
    ]

    initializeWithID: anID pickUp: pickUp dropOff: dropOff distance: distance duration: duration [
        rideID := anID.
        pickUpLocation := pickUp.
        dropOffLocation := dropOff.
        rideDistance := distance.
        rideDuration := duration.
        rideFare := self calculateFare.
    ]

    calculateFare [
        ^ rideDistance * 2 + rideDuration.
    ]

    displayDetails [
        Transcript show: 'Ride ID: ', rideID; cr.
        Transcript show: 'Pick Up: ', pickUpLocation; cr.
        Transcript show: 'Drop Off: ', dropOffLocation; cr.
        Transcript show: 'Distance: ', rideDistance printString; cr.
        Transcript show: 'Duration: ', rideDuration printString; cr.
        Transcript show: 'Fare: ', rideFare printString; cr.
    ]
]