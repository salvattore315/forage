//
//  File.swift
//  
//
//  Created by Salvador Martínez Landrian on 29/6/22.
//

import Foundation

struct PaymentMethodRequest: Codable {
    let type: String
    let reusable: Bool
    let number: String


    func pasToDict() -> [String:String] {
        return ["type": type,
                "reusable": reusable,
                "number": number]
    }
}
