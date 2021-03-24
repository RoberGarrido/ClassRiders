//
//  BreakingBadDAO.swift
//  ClassRiders
//
//  Created by Rober Garrido on 24/3/21.
//

import Foundation
import ObjectMapper

struct BreakingBadDAO: ImmutableMappable {

    static let defaultFront = "front_default"

    let id: Int
    let name: String
    let img: [String: Any]
    let status: String
    let nickname: String
    //let types: [[String: Any]]

    init(map: Map) throws {
        id = try map.value("id")
        name = try map.value("name")
        img = try map.value("portrait")
        status = try map.value("status")
        nickname = try map.value("nickname")
        //types = try map.value("types")
    }

    func mapping(map: Map) {
        id   >>> map["id"]
        name >>> map["name"]
        img >>> map["portrait"]
        status >>> map["status"]
        nickname >>> map["nickname"]
        //types >>> map["types"]
    }
}
