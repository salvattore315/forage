//
//  File.swift
//  
//
//  Created by Salvador Martínez Landrian on 29/6/22.
//

import Foundation

struct PaymentMethodResponse: Codable {
    let ref: String
    let type: String
    let balance: Balance
    let card: Card
}

struct Balance: Codable {
    let snap: Double
    let non_snap: Double
    let updated: String
}

struct Card: Codable {
    let last4: String
    let type: String
    let token: String
}
