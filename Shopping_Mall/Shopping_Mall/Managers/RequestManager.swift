//
//  RequestManager.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/10/21.
//

import Foundation
import UIKit

final class RequestManager: NSObject {
    private static let BASE_URL = "http://tradelist3-001-site1.itempurl.com/api/"
    private static let CONTENT_TYPE = "application/json"
    private static let HTTP_METHOD = "POST"
    
    private static let TEMP_TOKEN = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MzcxMDI3MjQsImlzcyI6Imh0dHA6Ly90cmFkZWxpc3QyLTAwMS1zaXRlMS5pdGVtcHVybC5jb20vIiwiYXVkIjoiTGlzdFRyYWRlIn0.L7-rCwyPoJePWknAThceJwxF16Dh7RMFi3_4hTlY_eI"
    
    //getters
//    static func baseURL()->String{
//        let baseURL = self.BASE_URL
//        return baseURL
//    }
//
//
//
//    static func tempToken()->String{
//        let token = self.TEMP_TOKEN
//        return token
//    }
//
//    static func contentType()->String{
//        let contentType = self.CONTENT_TYPE
//        return contentType
//    }
//
//    static func httpMethod()->String{
//        let httpMethod = self.HTTP_METHOD
//        return httpMethod
//    }
    static var baseURL:String{
        return self.BASE_URL
    }
    static var tempToken:String{
        return self.TEMP_TOKEN
    }
    static var contentType:String{
        return self.CONTENT_TYPE
    }
    static var httpMethod:String{
        return self.HTTP_METHOD
    }
    
}
