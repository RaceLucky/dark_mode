//
//  ViewController.swift
//  DarkModeExample
//
//  Created by Galexy on 09/05/2022.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var switchButton: UISwitch!
  @IBOutlet weak var foodItmeTableView: UITableView!
  @IBOutlet weak var textLabel: UILabel!
  @IBOutlet var mainView: UIView!
  
  var foodData = [FoodItem(icon: "Image_Color", name: "Card text", description: "Nulla vitae elit libero, a pharetra augue. "),
                  FoodItem(icon: "Image_Color", name: "Card text", description: "Nulla vitae elit libero, a pharetra augue. "),
                  FoodItem(icon: "Image_Color", name: "Card text", description: "Mauris condimentum nibh, ut fermentum massa justo sit am."),
                  FoodItem(icon: "Image_Color", name:  "Card text", description: "Mauris condimentum nibh, ut fermentum massa justo sit am.")]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initialSetup()
    foodData.append(contentsOf: foodData)
    imageView.tintColor = UIColor(named: "Label_Color")
    switchButton.layer.cornerRadius = 16
  }
  
  @IBAction func lightAndDarkSwitchButton(_ sender: UISwitch) {
    if switchButton.isOn{
      UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .dark
      switchButton.onTintColor  = .black
      switchButton.thumbTintColor  = .white
    } else {
      UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .light
      switchButton.thumbTintColor  = .black
      switchButton.tintColor = .systemRed
    }
  }
}

extension ViewController {
  
  private func initialSetup() {
    configuretext()
    configureTableView()
  }
  
  private func configureTableView() {
    foodItmeTableView.register(UINib(nibName: "FoodItemTableCell", bundle: nil), forCellReuseIdentifier: "FoodItemTableCell")
    foodItmeTableView.dataSource = self
    foodItmeTableView.delegate = self
    foodItmeTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
  }
  
  private func configuretext() {
    let thisisAttributtedString = NSMutableAttributedString(
      string: "This is",
      attributes: [
        .font: UIFont(name: "Geeza Pro Regular", size: 40)])
    
    let foodAttributtedString = NSMutableAttributedString(
      string: " food ",
      attributes: [
        .font: UIFont(name: "Geeza Pro Bold", size: 40)])
    
    let youAttributtedString = NSMutableAttributedString(
      string: "you ",
      attributes: [
        .font: UIFont(name: "Geeza Pro Regular", size: 40)])
    
    let loveAttributtedString = NSMutableAttributedString(
      string: "love",
      attributes: [
        .font: UIFont(name: "Geeza Pro Bold", size: 40)])
    
    thisisAttributtedString.append(foodAttributtedString)
    thisisAttributtedString.append(youAttributtedString)
    thisisAttributtedString.append(loveAttributtedString)
    textLabel.attributedText = thisisAttributtedString
  }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return foodData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let foodItem = foodData[indexPath.row]
    let foodItemTableCell = tableView.dequeueReusableCell(withIdentifier: "FoodItemTableCell", for: indexPath) as! FoodItemTableCell
    foodItemTableCell.foodImageView.image = UIImage(named: foodItem.icon)
    foodItemTableCell.foodNameLabel.text = foodItem.name
    foodItemTableCell.fooddescriptionLabel.text = foodItem.description
    return foodItemTableCell
  }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
  }
}
