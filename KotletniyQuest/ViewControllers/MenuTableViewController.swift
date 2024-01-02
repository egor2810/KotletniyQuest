//
//  MenuTableViewController.swift
//  KotletniyQuest
//
//  Created by Егор Аблогин on 31.12.2023.
//

import UIKit

final class MenuTableViewController: UITableViewController {
    
    private let menu = DataStore.shared.menu
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        MealTime.allCases.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menu.filter{$0.section.rawValue == section}.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "meal", for: indexPath) as! CellForMeal
        
        let sectionMeal = menu.filter{
            $0.section.rawValue == indexPath.section
        }[indexPath.row]
        
        cell.mealImage.image = UIImage(named: sectionMeal.pictureURL)
        cell.mealNameLabel.text = sectionMeal.name
        cell.mealPriceLabel.text = "\(sectionMeal.price) RUB"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        MealTime.allCases[section].description
    }
    


}
