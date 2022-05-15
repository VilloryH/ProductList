//
//  PosterModel.swift
//  ProductList
//
//  Created by Vitaliy Petrovskiy on 4.04.22.
//
import Foundation
import SwiftUI

struct poster: Identifiable {
    let id = UUID()
    var title: String
    var subtitle:String
    var price:String
    var image:String
}

var posterdata = [
    poster(title: "Nike", subtitle: "Pullover", price: "150 $", image: "no"),
    poster(title: "Adidas", subtitle: "Sviter", price: "170 $", image: "no"),
    poster(title: "Adidas", subtitle: "Sviter", price: "170 $", image: "no"),
    poster(title: "Adidas", subtitle: "Sviter", price: "170 $", image: "no"),
    poster(title: "Adidas", subtitle: "Sviter", price: "170 $", image: "no"),
    poster(title: "Adidas", subtitle: "Sviter", price: "170 $", image: "no"),
    poster(title: "Puma", subtitle: "Boots", price: "30 $", image: "no")

]
var posterdata1 = [
    poster(title: "Adidas", subtitle: "Sviter", price: "170 $", image: "no"),
    poster(title: "Nike", subtitle: "Pullover", price: "150 $", image: "no"),
    poster(title: "Puma", subtitle: "Boots", price: "30 $", image: "no")

]
