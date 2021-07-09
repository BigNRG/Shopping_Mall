//
//  PromptDataModel.swift
//  Shopping_Mall
//
//  Created by Harut on 27.06.21.
//

import Foundation
import UIKit

struct Prompt:Codable {
    var countryID: Int?
    var symbol : String?
}

class Descriptions: Codable{
    
    enum CodingKeys: String, CodingKey{
        case descriptions = "descriptions"
        
    }
    
    var descriptions:[Description]?
    
    required init(from decoder: Decoder) throws {
        let contener = try decoder.container(keyedBy: CodingKeys.self)
        descriptions = try contener.decode([Description].self, forKey: .descriptions)
        
    }
}
class Description: Codable {
    var searchString: String?
    
    enum CodingKeys: String, CodingKey{
        case searchString = "searchString"
        
    }
    
    required init(from decoder: Decoder) throws {
        let contener = try decoder.container(keyedBy: CodingKeys.self)
        searchString = try contener.decode(String.self, forKey: .searchString)
        
    }
}
