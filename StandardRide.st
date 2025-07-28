"StandardRide.st"
Ride subclass: StandardRide [
    calculateFare [
        ^ rideDistance * 2 + rideDuration + 1.
    ]
]