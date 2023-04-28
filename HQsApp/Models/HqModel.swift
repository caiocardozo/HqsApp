//
//  HqModel.swift
//  HQsApp
//
//  Created by Caio Cardozo on 27/04/23.
//

import Foundation

struct HqModel: Codable {
    var id: String?
    var title: String?
    var issueNumber: String?
    var description: String?
    var isbn: String?
    var prices: [HqPrice]?
    var thumbnail: HqImage?
    var format: String?
}

struct HqImage: Codable {
    var path: String?
}

struct HqPrice: Codable {
    var type: String?
    var price: Float?
}
