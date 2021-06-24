//
//  RequestManager.swift
//  Shopping_Mall
//
//  Created by Norayr Grigoryan on 5/10/21.
//

import Foundation
import UIKit

final class RequestManager: NSObject {
    //old url http://tradelist3-001-site1.itempurl.com/api/
    private static let BASE_URL = "http://mallarmenia-001-site1.itempurl.com/api/"
    
    private static let CONTENT_TYPE = "application/json"
    private static let HTTP_METHOD = "POST"
    
    private static let TEMP_TOKEN = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MzkwNDEzMjMsImlzcyI6Imh0dHA6Ly90cmFkZWxpc3QyLTAwMS1zaXRlMS5pdGVtcHVybC5jb20vIiwiYXVkIjoiTGlzdFRyYWRlIn0.Fv8nM0C-NxQGLGQtucbpmSERbV_jb_lp80fI2tue63U"
    
    //getters

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
