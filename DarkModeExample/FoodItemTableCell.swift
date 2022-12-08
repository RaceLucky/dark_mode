//
//  FoodItemTableCell.swift
//  DarkModeExample
//
//  Created by Galexy on 09/05/2022.
//

import UIKit

class FoodItemTableCell: UITableViewCell {
  
  @IBOutlet weak var cellContainerView: UIView!
  @IBOutlet weak var fooddescriptionLabel: UILabel!
  @IBOutlet weak var foodNameLabel: UILabel!
  @IBOutlet weak var foodImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    cellContainerView.layer.cornerRadius = 6
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
}
