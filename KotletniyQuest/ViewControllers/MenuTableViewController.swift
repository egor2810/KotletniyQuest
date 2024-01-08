//
//  MenuTableViewController.swift
//  KotletniyQuest
//
//  Created by Егор Аблогин on 31.12.2023.
//

import UIKit

final class MenuTableViewController: UITableViewController {

    private var groupedMenu: [MealTime: [Meal]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupMenuBySection()
    }
    
    private func groupMenuBySection() {
        let menu = DataStore.shared.menu
        
        for section in MealTime.allCases {
            groupedMenu[section] = menu.filter { $0.section == section }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        groupedMenu.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = MealTime.allCases[section]
        return groupedMenu[sectionType]?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "meal", for: indexPath) as! CellForMeal
        
        let sectionType = MealTime.allCases[indexPath.section]
        if let meal = groupedMenu[sectionType]?[indexPath.row] {
            cell.mealImage.image = UIImage(named: meal.pictureURL)
            cell.mealNameLabel.text = meal.name
            cell.mealPriceLabel.text = meal.price.formatted()
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        MealTime.allCases[section].description
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    


}
