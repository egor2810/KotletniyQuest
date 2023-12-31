//
//  Meal.swift
//  KotletniyQuest
//
//  Created by Егор Аблогин on 31.12.2023.
//

struct Meal {
    let id: Int
    let name: String
    let section: mealTime
    let price: Int
    let pictureURL: String
    let description: String
    
    static func getMenu() -> [Meal] {
        DataStore.shared.menu
    }
}

enum mealTime: String {
    case breakfast = "Завтрак"
    case lunch = "Обед"
    case dinner = "Ужин"
    case snacks = "Перекусы"
    case desserts = "Десерты"
}

struct ShoppingCart {
    let position: [Int : Int] // id блюда : количество в корзине
}
