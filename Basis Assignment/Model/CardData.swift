//
//  CardData.swift
//  Basis Assignment
//
//  Created by Abdul chaudhary on 26/09/20.
//

import Foundation


struct ArrayData:Decodable {
    var data: [CardData]
}

struct CardData:Decodable {
    var id: String?
    var text: String?
}
