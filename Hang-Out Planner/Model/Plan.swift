//
//  Plan.swift
//  Hang-Out Planner
//
//  Created by Takayuki Yamaguchi on 2021-01-17.
//

import Foundation

/// var plans : [Plan]
struct Plan{
  let routes    : [Route]
  let totalDistance   : Double //meter
  
  let totalTimeByWalk : Int? // second
  let totalTimeByCar  : Int? // second
 

  static var samplePlan = Plan(routes: Route.sampleRoutes, totalDistance: Route.sampleRoutes.reduce(0, {$0+$1.distance}), totalTimeByWalk: Route.sampleRoutes.reduce(0, {$0+$1.timeToReachByWalk!}),totalTimeByCar: nil)
    
    // TESTING
    static var samplePlans:[Plan] = [Plan(routes: Route.sampleRoutes, totalDistance: Route.sampleRoutes.reduce(0, {$0+$1.distance}), totalTimeByWalk: Route.sampleRoutes.reduce(0, {$0+$1.timeToReachByWalk!}),totalTimeByCar: nil), Plan(routes: Route.sampleRoutes, totalDistance: Route.sampleRoutes.reduce(0, {$0+$1.distance}), totalTimeByWalk: Route.sampleRoutes.reduce(0, {$0+$1.timeToReachByWalk!}),totalTimeByCar: nil),Plan(routes: Route.sampleRoutes, totalDistance: Route.sampleRoutes.reduce(0, {$0+$1.distance}), totalTimeByWalk: Route.sampleRoutes.reduce(0, {$0+$1.timeToReachByWalk!}),totalTimeByCar: nil)]
}

//samplePlan:

//Plan(routes:
    //[Hang_Out_Planner.Route(startLocationId: 0, nextLocationId: 1, distance: 513.0, timeToReachByWalk: Optional(900), timeToReachByCar: nil),
    //Hang_Out_Planner.Route(startLocationId: 1, nextLocationId: 2, distance: 678.0, timeToReachByWalk: Optional(1320), timeToReachByCar: nil), Hang_Out_Planner.Route(startLocationId: 2, nextLocationId: 3, distance: 578.0, timeToReachByWalk: Optional(1140), timeToReachByCar: nil),
    // Hang_Out_Planner.Route(startLocationId: 3, nextLocationId: 0, distance: 329.0, timeToReachByWalk: Optional(420), timeToReachByCar: nil)], totalDistance: 2098.0, totalTimeByWalk: Optional(3780), totalTimeByCar: nil)
