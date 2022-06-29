//
//  File.swift
//  
//
//  Created by Salvador Martínez Landrian on 27/6/22.
//

import Foundation
import Alamofire

enum WebService: URLRequestConvertible {
    let baseUrl = "http://0.0.0.0:8080/api/"

    case paymenMethod(card: PaymentMethodRequest):


    var path: String {
        switch self {
        case .paymenMethod:
            return "payment_methods/"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .paymenMethod:
            return .post
        }
    }


    var parameters: Parameters? {
        switch self {
        case .paymenMethod(card):
            return card.pasToDict()
        default:
            nil
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = try URL(string: Constant.BaseURL.asURL()
            .appendingPathComponent(path)
            .absoluteString.removingPercentEncoding!)
        var request = URLRequest.init(url: url!)
        request.httpMethod = method.rawValue
        request.headers = ["MerchantAccountHeader":"",
                           "IdempotencyKeyHeader":""]
        return try URLEncoding.default.encode(request,with: parameters)
    }
}
