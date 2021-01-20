//
//  PlanDetailViewController.swift
//  Hang-Out Planner
//
//  Created by Takayuki Yamaguchi on 2021-01-17.
//

import UIKit



/// Screen for displaying Plan details.
class PlanDetailViewController: UIViewController {
 let cellIdForLocation = "locationCardCell"
  let cellIdForDistance = "distanceCardCell"
  
  // A plan selected at `PlanListTableViewController`
  let plan: Plan
  let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .grouped)
  
  lazy var tempImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "tempImage")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let sectionTitle: [String] = ["1st Location", "2nd Location", "3rd Location", "4th Location"]
    
  init(plan:Plan) {
    self.plan = plan
    super.init(nibName: nil, bundle: nil)
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    navigationController?.navigationBar.prefersLargeTitles = true
    title = "Here Is Your Plan!"
    view.addSubview(tempImage)
    tempImage.anchors(topAnchor: view.safeAreaLayoutGuide.topAnchor, leadingAnchor: view.safeAreaLayoutGuide.leadingAnchor, trailingAnchor: view.safeAreaLayoutGuide.trailingAnchor, bottomAnchor: nil, padding: UIEdgeInsets.init(top: 8, left: 8, bottom: 0, right: 8))
    
    view.addSubview(tableView)
    tableView.anchors(topAnchor: tempImage.bottomAnchor, leadingAnchor: view.safeAreaLayoutGuide.leadingAnchor, trailingAnchor: view.safeAreaLayoutGuide.trailingAnchor, bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor, padding: UIEdgeInsets.init(top: 8, left: 8, bottom: 0, right: 8))
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "temp")
    tableView.dataSource = self
    tableView.delegate = self
    
    tableView.register(LocationCardCell.self, forCellReuseIdentifier: cellIdForLocation)
    
  }

}

//Section 0, plan: Plan(routes: [Hang_Out_Planner.Route(startLocationId: 0, nextLocationId: 1, distance: 513.0, timeToReachByWalk: Optional(900), timeToReachByCar: nil),      Hang_Out_Planner.Route(startLocationId: 1, nextLocationId: 2, distance: 678.0, timeToReachByWalk: Optional(1320), timeToReachByCar: nil),    Hang_Out_Planner.Route(startLocationId: 2, nextLocationId: 3, distance: 578.0, timeToReachByWalk: Optional(1140), timeToReachByCar: nil), Hang_Out_Planner.Route(startLocationId: 3, nextLocationId: 0, distance: 329.0, timeToReachByWalk: Optional(420), timeToReachByCar: nil)],
 // totalDistance: 2098.0, totalTimeByWalk: Optional(3780), totalTimeByCar: nil)


// Display Table View with plan.startPoint location -> Route -> Time
extension PlanDetailViewController : UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return plan.routes.count    // 4
  }

  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2                    // Section ごとにlocationCardCell, DistanceCell
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: cellIdForLocation, for: indexPath)  as! LocationCardCell
      // 1つ目のルート
      let route = plan.routes[indexPath.section]
      cell.update(with: route)
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: cellIdForLocation, for: indexPath)
      return cell
    }
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return sectionTitle[section]

  }
}


extension PlanDetailViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
  }
}

