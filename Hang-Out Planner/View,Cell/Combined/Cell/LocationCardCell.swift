//
//  LocationCardCell.swift
//  Hang-Out Planner
//
//  Created by Yumi Machino on 2021/01/20.
//

import Foundation
import UIKit

class LocationCardCell: CardTVCell {
  // locationNamelb- > MediumHear
  // subtext
  var locationTitleLabel = MediumHeaderLabel(text: "")
  var addressLabel = SubTextLabel(text: "")
  
  override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: .default, reuseIdentifier: reuseIdentifier)
    let vStackView = VerticalStackView(arrangedSubviews: [locationTitleLabel, addressLabel], spacing: 3, alignment: .center, distribution: .fillProportionally)
    contentView.addSubview(vStackView)
    vStackView.matchParent()
    self.backgroundColor = .lightGray
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func update(with route: Route) {
    let id = route.startLocationId
    // set location title
    locationTitleLabel.text = "\(PlanCardTVCell.checkLocationName(id: id))"
    
    // set location address
    addressLabel.text = "\(LocationCardCell.checkLocationAddress(id: id))"
  }
  
  // Return Location address by location id
  static func checkLocationAddress(id: Int) -> String {
      var locationAddress = ""
      for location in Location.sampleLocations {
          if location.id == id {
              locationAddress = location.address
          }
      }
      return locationAddress
  }
  
  
}
