//
//  PlanCardTVCell.swift
//  Hang-Out Planner
//
//  Created by Takayuki Yamaguchi on 2021-01-17.
//

import UIKit


class PlanCardTVCell: CardTVCell {
    
    var totalTimelb = TextLabel(text: "")
    var totalTimeField = SmallHeaderLabel(text: "")
    var locationlb =  TextLabel(text: "")
    var locationField = TextLabel(text: "")
  
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        let totalTimeStack = HorizontalStackView(arrangedSubviews: [totalTimelb, totalTimeField], spacing: 5, alignment: .fill, distribution: .fillEqually)
        let locationStack = HorizontalStackView(arrangedSubviews: [locationlb, locationField], spacing: 5, alignment: .fill, distribution: .fillEqually)
        locationField.numberOfLines = 0
        locationField.sizeToFit()
        
        let vStackView = VerticalStackView(arrangedSubviews: [totalTimeStack, locationStack], spacing: 0, alignment: .fill, distribution: .fillProportionally)
        contentView.addSubview(vStackView)
        totalTimeStack.matchLeadingTrailing()
        totalTimeStack.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
        locationStack.matchLeadingTrailing()
        locationStack.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
//        locationStack.setContentHuggingPriority(.required, for: .vertical)
        locationStack.backgroundColor = .yellow
//        totalTimeStack.setContentHuggingPriority(.defaultLow, for: .horizontal)
        totalTimeStack.backgroundColor = .orange
        vStackView.matchParent()
        self.backgroundColor = .systemGray

  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
    

    
    func update(with plan: Plan) {
        //Plan(routes: [Hang_Out_Planner.Route(startLocationId: 0, nextLocationId: 1, distance: 513.0, timeToReachByWalk: Optional(900), timeToReachByCar: nil), Hang_Out_Planner.Route(startLocationId: 1, nextLocationId: 2, distance: 678.0, timeToReachByWalk: Optional(1320), timeToReachByCar: nil), Hang_Out_Planner.Route(startLocationId: 2, nextLocationId: 3, distance: 578.0, timeToReachByWalk: Optional(1140), timeToReachByCar: nil), Hang_Out_Planner.Route(startLocationId: 3, nextLocationId: 0, distance: 329.0, timeToReachByWalk: Optional(420), timeToReachByCar: nil)], totalDistance: 2098.0, totalTimeByWalk: Optional(3780), totalTimeByCar: nil)
        
        totalTimelb.text = "Total time: "
        if let totalTime = plan.totalTimeByWalk {
            let hour = calcToHour(minutes: totalTime).0
            let minute = calcToHour(minutes: totalTime).1
            totalTimeField.text = "\(hour) h \(minute) m"
            
        }
        locationlb.text = "Place to go: "
        for route in plan.routes {
            locationField.text = "\(checkLocationName(id: route.startLocationId))"
            print("\(checkLocationName(id: route.startLocationId))")
        }
    }
    
    
    // calculate minutes -> hour and second
    func calcToHour(minutes: Int) -> (Int, Double) {
        let calculateToDouble = Double(minutes / 60)
        let totalTimeInHour = Int(calculateToDouble)
        let minutes = (calculateToDouble.truncatingRemainder(dividingBy: 1) * 60)
        
        return (totalTimeInHour, minutes)
    }
    
    // Return Location title by location id
    func checkLocationName(id: Int) -> String {
        var locationName = ""
        for location in Location.sampleLocations {
            if location.id == id {
                locationName = location.title
            }
        }
        return locationName
    }
}
