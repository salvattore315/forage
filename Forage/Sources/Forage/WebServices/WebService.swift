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

    case paymenMethod:


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
        case .paymenMethod:
            return ["MerchantAccountHeader":"",
                    "IdempotencyKeyHeader":""]
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
        return try URLEncoding.default.encode(request,with: parameters)
    }
}
