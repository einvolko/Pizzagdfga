//
//  Model.swift
//  MyPizzaApp
//
//  Created by Михаил Супрун on 24.02.2024.
//

import Foundation
 let mainVC = ViewController()
let cornerRadius: CGFloat = 25

struct Product:Codable{
    let name: String
    let descript: String
    let cost : Int
    let type: Types
}
enum Types : CaseIterable, Comparable,Codable {
   
    case allProducts
    case pizza
    case burger
    case drink
    case cake
    case other
    case alcohol
    case sigarets
}

//var storage:[Product] = [Product(name: "Margarita", descript: "Tasty pizza (450 gr)", cost: 400, type: .pizza),
//                         Product(name: "Hamburger", descript: "Very very tasty burger (220 gr)", cost: 250, type: .burger),
//                         Product(name: "Sicilian", descript: "Pizza sicilia (480 gr)", cost: 500, type: .pizza),
//                         Product(name: "Tea", descript: "Tea (0.5l)", cost: 80, type: .drink),
//                         Product(name: "Paper", descript: "Paper list white color", cost: 5, type: .other),
//                         Product(name: "Honey Cake", descript: "Very tasty cake", cost: 500, type: .cake),
//                         Product(name: "Cofee", descript: "Arabica cofee (0.2l)", cost: 200, type: .drink),
//                         Product(name: "Bacon cheseeburger", descript: "Bacon cheseeburger very well", cost: 300, type: .burger),
//                         Product(name: "Beer", descript: "Beer strong (0.5l)", cost: 120, type: .alcohol),
//                         Product(name: "Parlament", descript: "Parlament", cost: 200, type: .sigarets),
//                         Product(name: "4 Chese", descript: "4 chese", cost: 500, type: .pizza),
//     ]

var storage:[Product] = [Product]()
   
var currentStorage = storage



