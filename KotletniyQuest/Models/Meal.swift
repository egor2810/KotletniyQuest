//
//  Meal.swift
//  KotletniyQuest
//
//  Created by Егор Аблогин on 31.12.2023.
//

struct Meal {
    let id: Int
    let name: String
    let section: MealTime
    let price: Int
    let pictureURL: String
    let description: String
}

enum MealTime: Int, CaseIterable {
    case breakfast
    case lunch
    case dinner
    case snacks
    case desserts
    
    var description: String {
        switch self {
        case .breakfast:
            return "Завтрак"
        case .lunch:
            return "Обед"
        case .dinner:
            return "Ужин"
        case .snacks:
            return "Перекусы"
        case .desserts:
            return "Десерты"
        }
    }
}

struct ShoppingCart {
    let position: [Int : Int] // id блюда : количество в корзине
}
