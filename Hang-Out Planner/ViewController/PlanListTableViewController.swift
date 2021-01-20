//
//  PlanListTableViewController.swift
//  Hang-Out Planner
//
//  Created by Takayuki Yamaguchi on 2021-01-17.
//

import UIKit

///  Screen which display list of plan `[Plan]`.
///  Receive `[Plan]` from Planner.
///  If user select one of `Plan`, it will move to next VC.
class PlanListTableViewController: UITableViewController {
    var cellId = "planCardCell"
    
  // [Plan] you receive from planner model
  let plans: [Plan]
    
// plans: Hang_Out_Planner.
    //Plan(routes:
        //[Hang_Out_Planner.Route(startLocationId: 0, nextLocationId: 1, distance: 513.0, timeToReachByWalk: Optional(900), timeToReachByCar: nil),
        //Hang_Out_Planner.Route(startLocationId: 1, nextLocationId: 2, distance: 678.0, timeToReachByWalk: Optional(1320), timeToReachByCar: nil),
        //Hang_Out_Planner.Route(startLocationId: 2, nextLocationId: 3, distance: 578.0, timeToReachByWalk: Optional(1140), timeToReachByCar: nil),
        // Hang_Out_Planner.Route(startLocationId: 3, nextLocationId: 0, distance: 329.0, timeToReachByWalk: Optional(420), timeToReachByCar: nil)],
        // totalDistance: 2098.0, totalTimeByWalk: Optional(3780), totalTimeByCar: nil),
    //Hang_Out_Planner.Plan(routes: [Hang_Out_Planner.Route(startLocationId: 0, nextLocationId: 1, distance: 513.0, timeToReachByWalk: Optional(900), timeToReachByCar: nil), Hang_Out_Planner.Route(startLocationId: 1, nextLocationId: 2, distance: 678.0, timeToReachByWalk: Optional(1320), timeToReachByCar: nil), Hang_Out_Planner.Route(startLocationId: 2, nextLocationId: 3, distance: 578.0, timeToReachByWalk: Optional(1140), timeToReachByCar: nil), Hang_Out_Planner.Route(startLocationId: 3, nextLocationId: 0, distance: 329.0, timeToReachByWalk: Optional(420), timeToReachByCar: nil)], totalDistance: 2098.0, totalTimeByWalk: Optional(3780), totalTimeByCar: nil), Hang_Out_Planner.Plan(routes: [Hang_Out_Planner.Route(startLocationId: 0, nextLocationId: 1, distance: 513.0, timeToReachByWalk: Optional(900), timeToReachByCar: nil), Hang_Out_Planner.Route(startLocationId: 1, nextLocationId: 2, distance: 678.0, timeToReachByWalk: Optional(1320), timeToReachByCar: nil), Hang_Out_Planner.Route(startLocationId: 2, nextLocationId: 3, distance: 578.0, timeToReachByWalk: Optional(1140), timeToReachByCar: nil), Hang_Out_Planner.Route(startLocationId: 3, nextLocationId: 0, distance: 329.0, timeToReachByWalk: Optional(420), timeToReachByCar: nil)], totalDistance: 2098.0, totalTimeByWalk: Optional(3780), totalTimeByCar: nil)]
    
    let rowType: [String] = ["Total time", "Place to go"]
    
   // to pass info for PlanTVCell
  
    
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    navigationController?.navigationBar.prefersLargeTitles = true
    title = "Your Plans"
    tableView.register(PlanCardTVCell.self, forCellReuseIdentifier: cellId)
//    tableView.rowHeight = UITableView.automaticDimension
//    tableView.estimatedRowHeight = 200
  }
  
  init(plans: [Plan]) {
    self.plans = plans
//    super.init(nibName: nil, bundle: nil)
    super.init(style: .insetGrouped)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return plans.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->    Int {
        //  a row for total time + number of Route
        return 1
  }
  
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

   let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PlanCardTVCell

    
    switch indexPath.section {
    case 0:
        let plan = plans[indexPath.section]
        cell.update(with: plan)
        return cell

    case 1:
        let plan = plans[indexPath.section]
        cell.update(with: plan)
        return cell
    case 2:
        let plan = plans[indexPath.section]
        cell.update(with: plan)
        return cell
    default:
        fatalError("DequeReusable cell error")
    }

 
   }
   
  
}
