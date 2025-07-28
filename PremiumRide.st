"PremiumRide.st"
Ride subclass: PremiumRide [
    calculateFare [
        ^ rideDistance * 3 + rideDuration * 2.
    ]
]