//
//  PlanCardTVCell.swift
//  Hang-Out Planner
//
//  Created by Takayuki Yamaguchi on 2021-01-17.
//

import UIKit


class PlanCardTVCell: CardTVCell {
    
    var CellIndexPath: IndexPath?
    
   // Total time: , Place to go
//    var rowTitle = BasicLabel(text: "WHYYYY")
    var rowTitle = TextLabel(text: "")
   // Place to go cel
    var totalTimeField = SmallHeaderLabel(text: "")
    var locationField = TextLabel(text: "")
  
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        let hStackView = HorizontalStackView(arrangedSubviews: [rowTitle, totalTimeField], spacing: 3, alignment: .center, distribution: .fillEqually)
        contentView.addSubview(hStackView)
        hStackView.matchParent()
        self.backgroundColor = .systemGray

  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
    
    //Plan(routes: Route.sampleRoutes, totalDistance: Route.sampleRoutes.reduce(0, {$0+$1.distance}), totalTimeByWalk: Route.sampleRoutes.reduce(0, {$0+$1.timeToReachByWalk!}),totalTimeByCar: nil)]
    
    // cell 1: indexPath.row == 1
    // row1: text(Total time: ) + totalTimeByWalk
    
    // cell 2: indexPath.row == 2
    // row 2: text(Place to go) + Plan.rountes.Rounte[0].startLocationid,( Route[0].startLocation.title)
    // それぞれのRouteのlocation id, title表示
    
    func update(with plan: Plan) {
        //Plan(routes: [Hang_Out_Planner.Route(startLocationId: 0, nextLocationId: 1, distance: 513.0, timeToReachByWalk: Optional(900), timeToReachByCar: nil), Hang_Out_Planner.Route(startLocationId: 1, nextLocationId: 2, distance: 678.0, timeToReachByWalk: Optional(1320), timeToReachByCar: nil), Hang_Out_Planner.Route(startLocationId: 2, nextLocationId: 3, distance: 578.0, timeToReachByWalk: Optional(1140), timeToReachByCar: nil), Hang_Out_Planner.Route(startLocationId: 3, nextLocationId: 0, distance: 329.0, timeToReachByWalk: Optional(420), timeToReachByCar: nil)], totalDistance: 2098.0, totalTimeByWalk: Optional(3780), totalTimeByCar: nil)
        
        print("\(CellIndexPath)")
        if CellIndexPath?.row == 0 {
            rowTitle.text = "Total time: "
            if let totalTime = plan.totalTimeByWalk {
            totalTimeField.text = "\(totalTime) minutes"
            }
        } else if CellIndexPath?.row == 1, let cellIndexPath = CellIndexPath {
            rowTitle.text = "Total time: "
            totalTimeField.text = "\(plan.routes[(cellIndexPath.row) - 1].startLocationId)"
            
        } else {
            if let cellIndexPath = CellIndexPath {
            rowTitle.text = "other"
            totalTimeField.text = "\(plan.routes[(cellIndexPath.row) - 1].startLocationId)"
            }
        }
        // SamplelocationでidからLocation struct探し、そのtitle をprint
        


    }
    
}
