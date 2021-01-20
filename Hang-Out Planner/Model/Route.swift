//
//  Route.swift
//  Hang-Out Planner
//
//  Created by Takayuki Yamaguchi on 2021-01-17.
//

import Foundation

struct Route{
  let startLocationId : Int
  let nextLocationId  : Int

  let distance          : Double // meter
  
  // time(second) cost to go the next location.
  let timeToReachByWalk : Int?
  let timeToReachByCar  : Int?
  

  static var sampleRoutes : [Route] = [
    Route(
      startLocationId: Location.sampleStartPoint.id,
      nextLocationId: Location.sampleLocations[0].id,
      distance : 513, timeToReachByWalk: 15*60,
      timeToReachByCar: nil
    ),
    Route(
      startLocationId: Location.sampleLocations[0].id,
      nextLocationId: Location.sampleLocations[1].id,
      distance: 678, timeToReachByWalk: 22*60,
      timeToReachByCar: nil
    ),
    Route(
      startLocationId: Location.sampleLocations[1].id,
      nextLocationId: Location.sampleLocations[2].id,
      distance: 578, timeToReachByWalk: 19*60,
      timeToReachByCar: nil
    ),
    Route(
      startLocationId: Location.sampleLocations[2].id,
      nextLocationId: Location.sampleStartPoint.id,
      distance: 329, timeToReachByWalk: 7*60,
      timeToReachByCar: nil
    ),
  ]
}

//sampleRoute: [Hang_Out_Planner.Route(startLocationId: 0, nextLocationId: 1, distance: 513.0, timeToReachByWalk: Optional(900), timeToReachByCar: nil),
            // Hang_Out_Planner.Route(startLocationId: 1, nextLocationId: 2, distance: 678.0, timeToReachByWalk: Optional(1320), timeToReachByCar: nil), Hang_Out_Planner.Route(startLocationId: 2, nextLocationId: 3, distance: 578.0, timeToReachByWalk: Optional(1140), timeToReachByCar: nil),
            // Hang_Out_Planner.Route(startLocationId: 3, nextLocationId: 0, distance: 329.0, timeToReachByWalk: Optional(420), timeToReachByCar: nil)]
