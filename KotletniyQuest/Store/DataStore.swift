//
//  DataStore.swift
//  KotletniyQuest
//
//  Created by Егор Аблогин on 31.12.2023.
//

class DataStore {
    static let shared = DataStore()
    
    let menu: [Meal] = [
        Meal(id: 0, name: "", section: .breakfast, price: 0, pictureURL: "", description: "")
    ]
    
    private init() {
    }
}
