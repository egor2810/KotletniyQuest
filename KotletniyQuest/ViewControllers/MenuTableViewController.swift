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
        Set(menu.map{$0.section}).count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menu.filter{$0.section.rawValue == section}.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "meal", for: indexPath)
        
        let mealCell = cell as! CellForMeal
        
        let sectionMeal = menu.filter{
            $0.section.rawValue == indexPath.section
        }[indexPath.row]
        
        mealCell.mealImage.image = UIImage(named: sectionMeal.pictureURL)
        mealCell.mealNameLabel.text = sectionMeal.name
        mealCell.mealPriceLabel.text = "\(sectionMeal.price) RUB"

        return mealCell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        menu.first(where: {$0.section.rawValue == section})?.section.description
    }
    


}
