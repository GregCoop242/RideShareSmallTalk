| drivers riders random rating i input userType driverName driverPassword riderName riderPassword driver rider addRide rideID startLocation endLocation distance duration addRideResponse requestRideResponse isPremium pickUpLocation dropOffLocation ride premium requestRide |

Transcript show: 'Hello, World!'; cr.

drivers := OrderedCollection new.
riders := OrderedCollection new.
random := Random new.

"Create 10 drivers"
1 to: 10 do: [:i |
    rating := (1 to: 5) atRandom.
    drivers add: (
        (Driver new)
            initializeWithName: 'Driver ', i printString
            id: 'DID', i printString
            type: 'Sedan'
            number: 'V', i printString
            password: 'pass', i printString
            rating: rating
    )
].

"Create 10 riders"
1 to: 10 do: [:i |
    riders add: (
        (Rider new)
            initializeWithName: 'Rider ', i printString
            id: 'RID', i printString
            password: 'pass', i printString
    )
].

"Print all drivers"
drivers do: [:d | d displayInfo].
"Print all riders"
riders do: [:r | Transcript show: 'Rider ID: ', r id, ', Name: ', r name, ', password: ', r password; cr].

[ "Main loop"
    Transcript show: 'Are you a Driver or a Rider? (D/R, Q to quit): '; flush.
    input := FileStream stdin nextLine asUppercase.
    (input = 'Q') ifTrue: [
        Transcript show: 'Bye Bye!'; cr.
        ^self
    ].
    (input = 'D') ifTrue: [
        Transcript show: 'Enter driver name: '; flush.
        driverName := FileStream stdin nextLine.
        Transcript show: 'Enter driver password: '; flush.
        driverPassword := FileStream stdin nextLine.
        driver := drivers detect: [:d | (d id = driverName) and: [d password = driverPassword]] ifNone: [nil].
        driver ifNotNil: [
            Transcript show: 'Welcome, ', driver name, '!'; cr.
            driver displayInfo.
            Transcript show: 'Do you want to add a ride? (yes/no): '; flush.
            addRideResponse := FileStream stdin nextLine asLowercase.
            (addRideResponse = 'yes') ifTrue: [
                Transcript show: 'Enter rideID: '; flush.
                rideID := FileStream stdin nextLine.
                Transcript show: 'Enter start location: '; flush.
                startLocation := FileStream stdin nextLine.
                Transcript show: 'Enter end location: '; flush.
                endLocation := FileStream stdin nextLine.
                Transcript show: 'Enter distance (number): '; flush.
                distance := (FileStream stdin nextLine) asInteger.
                Transcript show: 'Enter duration (number): '; flush.
                duration := (FileStream stdin nextLine) asInteger.
                addRide := StandardRide new.
                addRide initializeWithID: rideID pickUp: startLocation dropOff: endLocation distance: distance duration: duration.
                driver addRide: addRide.
                Transcript show: 'Ride added successfully!'; cr.
            ] ifFalse: [
                Transcript show: 'No ride added.'; cr.
            ].
        ] ifNil: [
            Transcript show: 'Driver not found or incorrect password.'; cr.
        ].
    ].
    (input = 'R') ifTrue: [
        Transcript show: 'Enter rider name: '; flush.
        riderName := FileStream stdin nextLine.
        Transcript show: 'Enter rider password: '; flush.
        riderPassword := FileStream stdin nextLine.
         rider := riders detect: [:r | (r id = riderName) and: [r password = riderPassword]] ifNone: [ nil ].        rider ifNotNil: [
            Transcript show: 'Welcome, ', rider name, '!'; cr.
            Transcript show: 'Do you want to request a ride? (yes/no): '; flush.
            requestRideResponse := FileStream stdin nextLine asLowercase.
            (requestRideResponse = 'yes') ifTrue: [
                Transcript show: 'Do you want a premium ride? (yes/no): '; flush.
                isPremium := FileStream stdin nextLine asLowercase = 'yes'.
                Transcript show: 'Enter pick-up location: '; flush.
                pickUpLocation := FileStream stdin nextLine.
                Transcript show: 'Enter drop-off location: '; flush.
                dropOffLocation := FileStream stdin nextLine.
                ride := rider requestRideFrom: drivers asArray premium: isPremium pickUp: pickUpLocation dropOff: dropOffLocation.
                Transcript show: 'Ride requested successfully!'; cr.
            ] ifFalse: [
                Transcript show: 'No ride requested.'; cr.
            ].
        ] ifNil: [
            Transcript show: 'Rider not found or incorrect password.'; cr.
        ].
    ].
    (input ~= 'D' and: [input ~= 'R']) ifTrue: [
        Transcript show: 'Invalid input. Please enter D, R, or Q.'; cr.
    ].
    true
] whileTrue.